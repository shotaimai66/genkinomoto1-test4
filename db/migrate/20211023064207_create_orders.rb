class CreateOrders < ActiveRecord::Migration[6.1]
  def change
    create_table :orders do |t|
      t.references :item, null: false, foreign_key: true
      t.references :cart, null: false, foreign_key: true
      t.integer :quantity
      t.integer :sub_total
      t.integer :shipping_fee
      t.integer :handling_fee
      t.integer :tax
      t.integer :grand_total

      t.timestamps
    end
  end
end
