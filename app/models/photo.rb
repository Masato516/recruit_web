class Photo < ApplicationRecord
  # Shrineを継承したImageUploaderクラス
  # include ImageUploader[:image]
  include ImageUploader::Attachment(:image)
end
