class CreateJoinTableMaisonmereProfile < ActiveRecord::Migration[5.1]
  def change
    create_join_table :maisonmeres, :profiles do |t|
      t.index [:maisonmere_id, :profile_id]
    end
  end
end
