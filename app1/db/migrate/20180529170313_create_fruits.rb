class CreateFruits < ActiveRecord::Migration[5.2]
  def change
    create_table :fruits do |t|
      t.integer :seed_id
      t.string :name

      t.timestamps
    end
  end
end
