class PostImage < ApplicationRecord

  # ActiveStorageの設定
  has_one_attached :image

  # アソシエーション
  belongs_to :user

  def get_image
    unless image.attached?
      file_path = Rails.root.join('app/assets/images/no_image.jpg')
      image.attach(io: File.open(file_path), filename: 'default-image.jpg', content_type: 'image/jpeg')
    end
    image
  end

end
