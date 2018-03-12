class CreateEntreprises < ActiveRecord::Migration[5.1]
  def change
    create_table :entreprises do |t|
      t.string :maisonmere
      t.string :entreprise
      t.references :profile, foreign_key: true

      t.timestamps
    end
  end
end
