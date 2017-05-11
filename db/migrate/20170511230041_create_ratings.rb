class CreateRatings < ActiveRecord::Migration
  def change
    create_table :ratings do |t|
      t.integer :stars
      t.text :content
      t.integer :user_id
      t.integer :response_id

      t.timestamps

    end
  end
end
