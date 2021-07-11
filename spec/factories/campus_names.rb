# == Schema Information
#
# Table name: campus_names
#
#  id         :bigint           not null, primary key
#  name       :string(255)
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
FactoryBot.define do

  factory :campus_name do
    id { 1 }
    name { '草津' }
  end
end
