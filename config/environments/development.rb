# Settings specified here will take precedence over those in config/environment.rb

# In the development environment your application's code is reloaded on
# every request.  This slows down response time but is perfect for development
# since you don't have to restart the webserver when you make code changes.
config.cache_classes = false

# Log error messages when you accidentally call methods on nil.
config.whiny_nils = true

# Show full error reports and disable caching
config.action_controller.consider_all_requests_local = true
config.action_view.debug_rjs                         = true
config.action_controller.perform_caching             = false
config.action_view.cache_template_extensions         = false

# Action Mailer configuration (development)
config.action_mailer.raise_delivery_errors = true	# mettre a false en prod
config.action_mailer.default_charset = "utf-8"
config.action_mailer.delivery_method = :smtp		# :test stok dans une variable
config.action_mailer.smtp_settings = {
	:address => "smtp.neuf.fr",
	:port => 25,
	:domain => "neuf.fr",
}
config.action_mailer.perform_deliveries = true


#require 'tlsmail'
#Net::SMTP.enable_tls(OpenSSL::SSL::VERIFY_NONE)
#
#ActionMailer::Base.server_settings = {
#	:address => 'smtp.gmail.com',
#	:port => 587,
#	:domain => 'yourdomain.com',
#	:authentication => :plain,
#	:user_name => 'username',
#	:password => 'password'
#}
