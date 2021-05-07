class CreateBaskets < ActiveRecord::Migration[6.0]
  def change
    create_table :baskets do |t|
      t.boolean :status, default: false
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
