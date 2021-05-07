class ChangeAvailableQuantityInProducts < ActiveRecord::Migration[6.0]
  def change
    rename_column :products, :avaliable_quantity, :available_quantity
  end
end
