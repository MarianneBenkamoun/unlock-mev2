class CreateProfiles < ActiveRecord::Migration[5.1]
  def change
    create_table :profiles do |t|
      t.boolean :status, null: false, default: false
      t.string :photo
      t.string :phone_number
      t.string :last_name
      t.string :first_name
      t.boolean :status
      t.string :profile_type


      t.references :user, foreign_key: true
      t.references :entreprise, foreign_key: true


      t.timestamps
    end
  end
end
