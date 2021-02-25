CampusName.find_or_create_by(id: 1, name: "草津")
CampusName.find_or_create_by(id: 2, name: "茨木")
CampusName.find_or_create_by(id: 3, name: "衣笠")
CampusName.find_or_create_by(id: 4, name: "その他")

Reward.find_or_create_by(id: 1, name: "報酬なし")
Reward.find_or_create_by(id: 2, name: "謝金あり")
Reward.find_or_create_by(id: 3, name: "その他")

faculty_arry = %w(スポーツ健康科学部・研究科 食料マネジメント学部・研究科 理工学部・研究科 情報理工学部・研究科 生命科学部・研究科 薬学部・研究科 経済学部・研究科 経営学部・研究科 政策科学部・研究科 総合心理学部・研究科 グローバル教養学部・研究科 法学部・研究科 産業社会学部・研究科 国際関係学部・研究科 文学部・研究科 映像学部・研究科 その他)

# faculty_arry.map.with_index(1) {|faculty, index|
#   Faculty.find_or_create_by(
#     id: index,
#     name: faculty
#   )
# }

User.find_or_create_by(firstName: '八木', lastName: '雅斗', admin: true, faculty_id: 1, email: Rails.application.credentials.dig(:admin_user, :email), password: Rails.application.credentials.dig(:admin_user, :password), confirmed_at: Time.now)