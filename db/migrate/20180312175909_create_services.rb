class CreateServices < ActiveRecord::Migration[5.1]
  def change
    create_table :services do |t|
      t.string :name
      t.string :description
      t.string :picture
      t.integer :price
      t.references :parent, index: true


      t.timestamps
    end
  end
end
