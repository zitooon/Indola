class AdminController < ApplicationController

 def index
	 if verif_admin
		 @users = User.find(:all, :conditions => ['status = ?', 0])
     render :action => 'index'
	 else
		 render :action => 'login'
	 end
 end
 
 def verif_admin
	 if session[:admin]
		 return true
	 else
		 return false
	 end
 end
 
 def export
	 if verif_admin
		 headers['Content-Type'] = "application/vnd.ms-excel" 
		 headers['Content-Disposition'] = 'attachment; filename="excel-export.xls"'
		 headers['Cache-Control'] = ''
		 @users = User.find(:all)
     render :layout => false
	else
		render :action => 'login'
	end
end
 
 def login 
	 if (params[:admin][:name] == "admin" && params[:admin][:password] == "0132")
		 session[:admin] ||= true
		 flash[:notice] = 'Vous avez &eacute;t&eacute; connect&eacute; avec succ&egrave;s.'
		 redirect_to :action => 'index'
	 else
		 flash[:admin] = 'Bad name or password.'
		 render :action => 'login'
	 end
 end
 
 def logout
	 session[:admin] = nil
	 flash[:notice] = 'Vous avez &eacute;t&eacute; d&eacute;connect&eacute; avec succ&egrave;s.'
	 redirect_to :controller => 'welcome', :action => 'show'
 end
 
 def validate
	  @user = User.find(params[:h])
	  
	  @user.status = 1
	if @user.save
		  flash[:notice] = 'L\'utilisateur a &eacute;t&eacute; valider avec succ&egarve;s..'
		  user = @user
		  SubscriptionMailer.deliver_validateduser(user)
		  redirect_to :action => 'index'
	  end
 end
 
 def emailyouwin
  @users = User.find(:all)
  i = 0;
  @users.each_with_index do |user, index|
    i += 1
    if index > 23
    SubscriptionMailer.deliver_youwin(user)
  end
  end
  flash[:notice] = i.to_s+' emails ont etes envoyes avec succes.'
  redirect_to :action => 'index'
 end
end
