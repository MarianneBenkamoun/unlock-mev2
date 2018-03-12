class CreateSubservices < ActiveRecord::Migration[5.1]
  def change
    create_table :subservices do |t|
      t.string :name
      t.integer :price
      t.string :picture
      t.string :description
      t.references :service, foreign_key: true
      t.references :subservice, foreign_key: true

      t.timestamps
    end
  end
end
