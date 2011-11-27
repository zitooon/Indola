class FriendsController < ApplicationController

def index
  if params[:email].nil?
    if params[:one].nil?
      @firstemail = ''
    else
      @firstemail = params[:one]    
    end
    if params[:name].nil?
      @name = ''
    else
      @name = params[:name]    
    end
  else
     @name = ''
      @firstemail = params[:email][:one]
  end
 end

  def sendemail
    flash[:friend] = ''
    if params[:email][:one] == ''
      flash[:friend] += 'Veuillez renseigner une adresse mail<br/>'
    end
    if params[:name][:first] == ''
      flash[:friend] += 'Veuillez renseigner votre pr&eacute;nom<br/>'
    end
    if flash[:friend] == ''  
      name = params[:name][:first]
      email = params[:email][:one]
      SubscriptionMailer.deliver_friend(email, name)
      if params[:email][:two] != ''
        email = params[:email][:two]
        SubscriptionMailer.deliver_friend(email, name)    
      end
      if params[:email][:three] != ''
        email = params[:email][:three]
        SubscriptionMailer.deliver_friend(email, name)    
      end
      if params[:email][:four] != ''
        email = params[:email][:four]
        SubscriptionMailer.deliver_friend(email, name)    
      end
      if params[:email][:five] != ''
         email = params[:email][:five]
         SubscriptionMailer.deliver_friend(email, name)    
      end
      render :action => 'confirmation'
    else
      redirect_to :action => 'index', :one => params[:email][:one], :name => params[:name][:first]
    end
   end
end
