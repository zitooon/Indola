class CartController < ApplicationController
	def addtocart
		@nb_items = Cart.count(:all, :conditions => ["ip = ?", request.remote_ip])
		if @nb_items < 8
			if  Cart.count(:all, :conditions => ["ip = ? AND voted_user_id = ?", request.remote_ip, params[:h].to_i]) == 0
				@cart = Cart.new()
				@cart.ip = request.remote_ip
				@cart.voted_user_id = params[:h].to_i
				@cart.save
			else
				flash[:cart] = 'Vous avez d&eacute;j&agrave; s&eacute;lectionn&eacute cette photo'				 
			end
		else
			flash[:cart] = 'Vous avez d&eacute;j&agrave; s&eacute;lectionn&eacute; 8 photos. Vous pouvez supprimer des photos de votre s&eacute;lection en cliquant sur la croix'				 
		end
		redirect_to :controller => "pictures", :page => params[:page]
	end
	
	def delfromcart
		@cart = Cart.find(params[:h])
		@cart.destroy
		redirect_to :controller => "pictures", :page => params[:page]
	end
end
