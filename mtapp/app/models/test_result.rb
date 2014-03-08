class TestResult < ActiveRecord::Base
  attr_accessible :auth_token
  belongs_to :api_test
end
