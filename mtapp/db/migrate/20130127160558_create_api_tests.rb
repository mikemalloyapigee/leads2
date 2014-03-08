class CreateApiTests < ActiveRecord::Migration
  def change
    create_table :api_tests do |t|
      t.text :auth_url
      t.string :auth_headers
      t.text :auth_body

      t.timestamps
    end
  end
end
