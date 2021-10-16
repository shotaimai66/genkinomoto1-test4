class Item < ApplicationRecord
  
  validates :name, presence: true, length: { maximum: 300 }
  
  # 商品画像をアップロードする
  mount_uploader :image, ImageUploader
end
