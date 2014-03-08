class ChangeAuthHeaders < ActiveRecord::Migration
  def up
    change_column :api_tests, :auth_headers, :text
  end

  def down
  end
end
