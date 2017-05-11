class CreateResponses < ActiveRecord::Migration
  def change
    create_table :responses do |t|
      t.text :content
      t.integer :vignette_id
      t.integer :user_id

      t.timestamps

    end
  end
end
