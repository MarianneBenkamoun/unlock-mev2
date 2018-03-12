class CreateProfiles < ActiveRecord::Migration[5.1]
  def change
    create_table :profiles do |t|
      t.boolean :status, null: false, default: false
      t.string :photo

      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
