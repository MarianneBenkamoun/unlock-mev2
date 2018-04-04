class CreateCourses < ActiveRecord::Migration[5.1]
  def change
    create_table :courses do |t|
      t.string :sku

      t.integer :price_cents
      t.string :status
      t.json :payment  # Edited
      t.boolean :accepted
      t.datetime :date
      t.string :datetext
      t.string :hourtext
      t.string :photodoor
      t.string :photoserrure
      t.string :estimate
      t.monetize :price, currency: { present: false }
      t.references :profile, foreign_key: true
      t.references :service, foreign_key: true
      t.timestamps
    end
  end
end
