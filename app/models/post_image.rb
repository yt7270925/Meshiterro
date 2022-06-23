class PostImage < ApplicationRecord

# ActiveStorageの設定
  has_one_attached :image

end
