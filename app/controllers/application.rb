# Filters added to this controller apply to all controllers in the application.
# Likewise, all the methods added will be available for all controllers.

class ApplicationController < ActionController::Base
  helper :all # include all helpers, all the time

	  before_filter :headers_iso
	  
	  def headers_iso
		  headers["content-type"]= "text/html; charset=iso-8859-1"
	  end
  
  # See ActionController::RequestForgeryProtection for details
  # Uncomment the :secret if you're not using the cookie session store
  protect_from_forgery # :secret => '95206a9221e72e32c104129625b79008'
end
