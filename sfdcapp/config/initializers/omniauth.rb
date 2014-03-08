OmniAuth.config.logger = Rails.logger
use OmniAuth::Builder do
   provider :salesforce, ENV['SALESFORCE_KEY'], ENV['SALESFORCE_SECRET']
end