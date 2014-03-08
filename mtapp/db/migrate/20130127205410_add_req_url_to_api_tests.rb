class AddReqUrlToApiTests < ActiveRecord::Migration
  def change
    add_column :api_tests, :request_url, :text
  end
end
