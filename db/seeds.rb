CampusName.find_or_create_by(id: 1, name: "草津")
CampusName.find_or_create_by(id: 2, name: "茨木")
CampusName.find_or_create_by(id: 3, name: "衣笠")
CampusName.find_or_create_by(id: 4, name: "その他")

Reward.find_or_create_by(id: 1, name: "報酬なし")
Reward.find_or_create_by(id: 2, name: "謝金あり")
Reward.find_or_create_by(id: 3, name: "その他")

faculty_arry = %w(スポーツ健康科学部 食料マネジメント学部 理工学部 情報理工学部 生命科学部 薬学部 経済学部 経営学部 政策科学部 総合心理学部 グローバル教養学部 法学部 産業社会学部 国際関係学部 文学部 映像学部 外部)

faculty_arry.map.with_index(1) {|faculty, index|
  Faculty.find_or_create_by(
    id: index,
    name: faculty
  )
}
