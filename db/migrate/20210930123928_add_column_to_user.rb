class AddColumnToUser < ActiveRecord::Migration[6.1]
  def change
    add_column :users, :name, :string
    add_column :users, :kana, :string
    add_column :users, :sex, :integer
    add_column :users, :birthday, :datetime
    add_column :users, :address, :string
    add_column :users, :enter_date, :datetime
    add_column :users, :exit_date, :datetime
    add_column :users, :flag, :boolean
    add_column :users, :store_id, :integer
  end
end
