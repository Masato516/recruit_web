# == Schema Information
#
# Table name: campus_names
#
#  id         :bigint           not null, primary key
#  name       :string(255)
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
class CampusName < ApplicationRecord
  has_many :boards
end
