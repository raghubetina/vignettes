class CreateVignettes < ActiveRecord::Migration
  def change
    create_table :vignettes do |t|
      t.text :content

      t.timestamps

    end
  end
end
