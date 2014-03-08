class ApiTest < ActiveRecord::Base
  attr_accessible :auth_body, :auth_headers, :auth_url, :request_url
  has_many :test_results
end
