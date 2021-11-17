class AddColumnToUser < ActiveRecord::Migration[6.1]
  def change
    add_column :users, :name, :string, null: false, default: ""
    add_column :users, :kana, :string
    add_column :users, :sex, :integer
    add_column :users, :birthday, :datetime
    add_column :users, :enter_date, :datetime
    add_column :users, :exit_date, :datetime
    add_column :users, :flag, :boolean, default: false, null: false
    add_column :users, :provider, :string
    add_column :users, :uid, :string
    add_column :users, :postal_code, :integer
    add_column :users, :prefecture_code, :string
    add_column :users, :city, :string
    add_column :users, :street, :string
    add_column :users, :other_address, :string
    add_reference :users, :store, foreign_key: true
  end
end
