class VoteController < ApplicationController

  def index
	  @pos = Cart.count(:all, :conditions => ["ip = ? AND position != ?", request.remote_ip, 0]).to_i
    if Cart.count(:all, :conditions => ["ip = ?", request.remote_ip]).to_i < 3
      @pos += 3 - Cart.count(:all, :conditions => ["ip = ?", request.remote_ip]).to_i
    end
    if Cart.count(:all, :conditions => ["ip = ? AND position = ?", request.remote_ip, 0]).to_i > 0
      if @pos == 0
          flash[:vote] = 'Vous allez maintenant pouvoir valider votre podium id&eacute;al<br/>Vous pouvez cliquer sur votre coiffure pr&eacute;f&eacute;r&eacute;e n&ordm;3'
      elsif @pos == 1
          flash[:vote] = 'Cliquez maintenant sur votre coiffure pr&eacute;f&eacute;r&eacute;e n&ordm;2'
      elsif @pos == 2
          flash[:vote] = 'Cliquez sur votre coiffure pr&eacute;f&eacute;r&eacute;e !'
      elsif @pos == 3
          render :action => 'final'
      end
  else
    render :action => 'final'
  end 
end
  
  def defposition
	  @pos = Cart.count(:all, :conditions => ["ip = ? AND position != ?", request.remote_ip, 0]).to_i + 1
    if Cart.count(:all, :conditions => ["ip = ?", request.remote_ip]).to_i < 3
      @pos += 3 - Cart.count(:all, :conditions => ["ip = ?", request.remote_ip]).to_i
    end
		 if @pos < 4
        @cart = Cart.find(params[:h])
	      @cart.position = @pos
		    @cart.save
     end
     redirect_to :action => 'index'
 end
  
  def cancel
	  @carts = Cart.find(:all, :conditions => ["ip = ? AND position != ?", request.remote_ip, 0])
	  
	  for cart in @carts
		  cart.position = 0
		  cart.save
	  end
	  redirect_to :action => 'index'
  end
  
   def validate
	   	if Tempip.count(:all, :conditions => ["ip = ?", request.remote_ip]).to_i == 1
			@tempip = Tempip.find(:all, :conditions => ["ip = ?", request.remote_ip])
			for tempip in @tempip
				if (Date.today  -  tempip.created_at.to_date).to_i >= 1
					tempip.destroy
				end
			end
		end
	   if Tempip.count(:all, :conditions => ["ip = ?", request.remote_ip]).to_i == 0
			@carts = Cart.find(:all, :conditions => ["ip = ?", request.remote_ip])		
			for cart in @carts
				@user = User.find(cart.voted_user_id)
				if cart.position == 1
					@user.note += 1
				elsif cart.position == 2
					@user.note += 2
				elsif cart.position == 3
					@user.note += 3
				end
				@user.save
				cart.destroy
			end
			@tempip = Tempip.new()
			@tempip.ip = request.remote_ip
			@tempip.save
			render :action => 'thankyou'
		else
			render :action => 'alreadyvoted'
		end   
   end
end
