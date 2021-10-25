class Cart < ApplicationRecord
  # A user has only one cart. User > Cart > Orders (join table) > Items
  belongs_to :user
  has_many :orders, dependent: :destroy # A cart has many orders.
  has_many :items, through: :orders # A cart has many items through orders.

  


end
