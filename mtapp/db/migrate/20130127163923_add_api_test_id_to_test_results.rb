class AddApiTestIdToTestResults < ActiveRecord::Migration
  def change
    add_column :test_results, :api_test_id, :integer
  end
end
