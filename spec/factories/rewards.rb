# # reward_list = %w(報酬なし 謝金あり その他)

FactoryBot.define do
  factory :reward do
    id { 1 }
    name { '報酬あり' }
  end
end