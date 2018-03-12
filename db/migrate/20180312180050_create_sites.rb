class CreateSites < ActiveRecord::Migration[5.1]
  def change
    create_table :sites do |t|
      t.string :type_of
      t.string :address
      t.float :longitude
      t.float :latitude
      t.references :course, foreign_key: true

      t.timestamps
    end
  end
end
