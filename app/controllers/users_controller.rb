require 'mini_magick'
      
class UsersController < ApplicationController

	def verif_admin
		 if session[:admin]
			 return true
		 else
			 return true
		 end
	 end

  def show
	 if verif_admin
		@user = User.find(params[:id])
	 else
		redirect_to :controller => 'admin'
	 end
  end

  def new
    @user = User.new
 end
 
 def image_crop(picture)
   
     image = MiniMagick::Image.from_file("#{RAILS_ROOT}/public/images/haircuts/"+picture)
    
     image.resize "500X500"
     image.write("#{RAILS_ROOT}/public/images/haircuts/"+picture)
    
     image.resize "100X100"
     image.write("#{RAILS_ROOT}/public/images/haircuts/thumbnails/"+picture)
     
     image.resize "50X50"
     image.write("#{RAILS_ROOT}/public/images/haircuts/thumbnails_sel/"+picture)
     
     if (File.chmod(0644, "#{RAILS_ROOT}/public/images/haircuts/thumbnails_sel/"+picture, "#{RAILS_ROOT}/public/images/haircuts/thumbnails/"+picture) != 2)
      flash[:user] = 'error system'
     end
 end
 
 def create
  @user = User.new(params[:user])
  
   flash[:user] = ''
   if params[:rights][:yes].eql?('0')
     flash[:user] = 'Vous devez cocher la case "Je certifie avoir les droits de cette photo"<br/>'
   end
   if params[:rules][:ok].eql?('0')
     flash[:user] += 'Vous devez cocher la case "Je reconnais avoir pris connaissance du r&egrave;glement"<br/>'
   end
  if (flash[:user] == '' and params[:fichier] != "")
      if (params[:fichier].size < 2500000)
         @ext = params[:fichier].original_filename.split(".").last.downcase
         if (@ext.eql?('jpg') or @ext.eql?('jpeg') or @ext.eql?('gif') or @ext.eql?('png') or @ext.eql?('bmp'))
           File.open("#{RAILS_ROOT}/public/images/haircuts/"+@user.username+"."+@ext, "wb") do |f| 
		     	  f.write(params[:fichier].read)
		       end
           @user.picture = @user.username+"."+@ext
		       image_crop(@user.picture)
        else
          flash[:user] = "Votre image n'est pas valide"
        end
      else
        flash[:user] = "Votre photo est trop volumineuse (2Mo maximum)"
      end
    end
			if flash[:user] == '' and @user.save
	    	SubscriptionMailer.deliver_noticetoadmin()
				render :action => "confirmation"
			else
				render :action => "new"
			end
  end

 def destroy
	  if verif_admin
		 @user = User.find(params[:id])
		 if @user.picture
			  if (File.exist?("#{RAILS_ROOT}/public/images/haircuts/"+@user.picture))
				  File.delete("#{RAILS_ROOT}/public/images/haircuts/"+@user.picture)
				end
       if (File.exist?("#{RAILS_ROOT}/public/images/haircuts/thumbnails/"+@user.picture))
          File.delete("#{RAILS_ROOT}/public/images/haircuts/thumbnails/"+@user.picture)
        end
        if (File.exist?("#{RAILS_ROOT}/public/images/haircuts/thumbnails_sel/"+@user.picture))
          File.delete("#{RAILS_ROOT}/public/images/haircuts/thumbnails_sel/"+@user.picture)
        end
		  end
		  user = @user
		  SubscriptionMailer.deliver_refuseduser(user)
		  @user.destroy
      flash[:notice] = 'L\'utilisateur a &eacute;t&eacute; supprimer avec succ&egrave;s.'
		  redirect_to :controller => 'admin'
		else
		  redirect_to :controller => 'admin'
	  end  
  end
end
