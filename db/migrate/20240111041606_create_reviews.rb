class CreateReviews < ActiveRecord::Migration[7.0]
  def change
    create_table :reviews do |t|
      t.integer :rating
      t.text :content
      t.references :restaurant, null: false, foreign_key: true
      # It generates restaurant_id foreign key

      t.timestamps
    end
  end
end
