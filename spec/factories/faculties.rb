# == Schema Information
#
# Table name: faculties
#
#  id         :bigint           not null, primary key
#  name       :string(255)
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
FactoryBot.define do

#   faculty_list = %w(スポーツ健康科学部 食料マネジメント学部 理工学部 情報理工学部 生命科学部 薬学部 経済学部 経営学部 政策科学部 総合心理学部 グローバル教養学部 法学部 産業社会学部 国際関係学部 文学部 映像学部 外部)
  
#   faculty_list.map.with_index(1){|faculty, index|
  
#     factory :faculty do
#         id { index }
#         name { faculty }
#     end
#   }
  factory :faculty do
    id { 1 }
    name { 'スポーツ健康科学部' }
  end
end