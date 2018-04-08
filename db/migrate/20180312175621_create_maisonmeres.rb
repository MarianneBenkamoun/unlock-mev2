class CreateMaisonmeres < ActiveRecord::Migration[5.1]
  def change
    create_table :maisonmeres do |t|
      t.string :name

      t.timestamps
    end
  end
end
