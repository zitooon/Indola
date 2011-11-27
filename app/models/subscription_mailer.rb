class SubscriptionMailer < ActionMailer::Base

 def noticetoadmin()
	 @subject      = 'Nouvelle photo sur Street-Tribe.fr'
	 @body		     = render_message("noticetoadmin", :u => 0)
	 @recipients   = 'admin@street-tribe.fr'
	 @from         = 'www.street-tribe.fr <alerte@street-tribe.fr>'
	 @sent_on      = Time.now
	 @headers      = {}
	 @content_type = "text/html"
 end
 
 def validateduser(user)
	 @subject      = user.firstname + ', votre photo est en ligne !'
	 @body		     = render_message("validateduser", :user => user)
	 @recipients   = user.email
	 @from         = 'www.street-tribe.fr <admin@street-tribe.fr>'
	 @sent_on      = Time.now
	 @headers      = {}
	 @content_type = "text/html"
 end

  def refuseduser(user)
	  @recipients   = user.email
    @subject      = user.firstname + ', votre photo sur Street-Tribe.fr ' 
    @body         = render_message("refuseduser", :user => user)
    @from         = 'www.street-tribe.fr <admin@street-tribe.fr>'
	  @sent_on      = Time.now
	  @headers      = {}
	  @content_type = "text/html"
	end
 
   def friend(email, name)
	   @subject      = name + ' veut vous faire gagner un week-end à Londres'
	   @body		     = render_message("friend", :name => name)
	   @recipients   = email
	   @from         = 'www.street-tribe.fr <admin@street-tribe.fr>'
	   @sent_on      = Time.now
	   @headers      = {}
	   @content_type = "text/html"
   end
   
    def youwin(user)
 	   @subject      = user.firstname + ' avez-vous gagné le grand jeu ? '
 	   @body		     = render_message("youwin", :name => user.firstname)
 	   @recipients   = user.email
 	   @from         = 'www.street-tribe.fr <admin@street-tribe.fr>'
 	   @sent_on      = Time.now
 	   @headers      = {}
 	   @content_type = "text/html"
    end
end
