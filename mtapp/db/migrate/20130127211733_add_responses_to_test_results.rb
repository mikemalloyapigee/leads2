class AddResponsesToTestResults < ActiveRecord::Migration
  def change
    add_column :test_results, :response_body, :text
    add_column :test_results, :req_response_code, :integer
  end
end
