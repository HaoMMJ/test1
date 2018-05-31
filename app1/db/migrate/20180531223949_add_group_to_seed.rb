class AddGroupToSeed < ActiveRecord::Migration[5.2]
  def change
    add_column :seeds, :group, :integer, default: 1
  end
end
