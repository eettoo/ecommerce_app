# Load the Rails application.
require_relative 'application'

# Initialize the Rails application.
Rails.application.initialize!

ActionMailer::Base.smtp_settings = {
  :user_name => ENV['SG_USERNAME'],
  :password => ENV['SG_PASSWORD'],
  :domain => ENV['SG_DOMAIN'],
  :address => ENV['SG_ADDRESS'],
  :port => 587,
  :authentication => :plain,
  :enable_starttls_auto => true
}