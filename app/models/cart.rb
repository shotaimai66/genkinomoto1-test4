class Cart < ApplicationRecord
  # A user has only one cart. User > Cart > Orders (join table) > Items
  belongs_to :user
  # A cart has many orders.
  # Cartを削除するとOrdersも削除されます
  has_many :orders, dependent: :destroy
  has_many :items, through: :orders # A cart has many items through orders.

  


end
