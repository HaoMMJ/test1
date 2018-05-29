class CreateSeeds < ActiveRecord::Migration[5.2]
  def change
    create_table :seeds do |t|
      t.string :label
      t.boolean :is_consumed, default: false

      t.timestamps
    end
  end
end
