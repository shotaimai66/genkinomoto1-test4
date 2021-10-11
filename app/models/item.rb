class Item < ApplicationRecord
  
  validates :name, presence: true, length: { maximum: 50 }
  
  # 商品画像をアップロードする
  mount_uploader :image, ImageUploader
end
