class CreateTestResults < ActiveRecord::Migration
  def change
    create_table :test_results do |t|
      t.text :auth_token

      t.timestamps
    end
  end
end
