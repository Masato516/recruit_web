# == Schema Information
#
# Table name: faculties
#
#  id         :bigint           not null, primary key
#  name       :string(255)
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
class Faculty < ApplicationRecord
  has_many :users
end
