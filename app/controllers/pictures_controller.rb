class PicturesController < ApplicationController
	
	def index
	  	@users = User.find(:all, :conditions => ["status = ?", 1])
		
		@nb_users = User.count(:all, :conditions => ["status = ?", 1])
		@nb_items = Cart.count(:all, :conditions => ["ip = ?", request.remote_ip])
		if @nb_items >= 8
			@select = false
		else
			@select = true
		end
		@nb_photo_per_page = 8
		if @nb_users % @nb_photo_per_page >= 1
			@nb_pages = (@nb_users / @nb_photo_per_page + 1)
		else
			@nb_pages = @nb_users / @nb_photo_per_page
		end
		if params[:page].nil?
			@page = 0
		else
			@page = params[:page].to_i
		end
		@start_photo = ((@page * @nb_photo_per_page) + 1)
		@break = (@start_photo + @nb_photo_per_page)
  end

  def show
    @user = User.find(params[:uid])
    render :action => 'show', :layout => false
  end
end
