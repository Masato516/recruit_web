# == Schema Information
#
# Table name: photos
#
#  id         :bigint           not null, primary key
#  image_data :text(65535)
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
class Photo < ApplicationRecord
  include ImageUploader::Attachment(:image)
end
