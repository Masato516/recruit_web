# == Schema Information
#
# Table name: rewards
#
#  id         :bigint           not null, primary key
#  name       :string(255)
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
# # reward_list = %w(報酬なし 謝金あり その他)

FactoryBot.define do
  factory :reward do
    id { 1 }
    name { '報酬あり' }
  end
end
