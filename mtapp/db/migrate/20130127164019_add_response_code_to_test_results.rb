class AddResponseCodeToTestResults < ActiveRecord::Migration
  def change
    add_column :test_results, :response_code, :integer
  end
end
