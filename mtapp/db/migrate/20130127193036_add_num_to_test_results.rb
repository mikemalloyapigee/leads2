class AddNumToTestResults < ActiveRecord::Migration
  def change
    add_column :test_results, :number, :integer
  end
end
