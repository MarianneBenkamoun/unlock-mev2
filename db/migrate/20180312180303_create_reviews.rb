class CreateReviews < ActiveRecord::Migration[5.1]
  def change
    create_table :reviews do |t|
      t.string :price
      t.string :description
      t.references :profile, foreign_key: true
      t.references :course, foreign_key: true

      t.timestamps
    end
  end
end
