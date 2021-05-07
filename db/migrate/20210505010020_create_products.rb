class CreateProducts < ActiveRecord::Migration[6.0]
  def change
    create_table :products do |t|
      t.string :name
      t.float :price
      t.text :description
      t.integer :avaliable_quantity
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
