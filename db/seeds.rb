user = User.new(
  last_name:   '八木',
  first_name:  '雅斗',
  admin:        true, 
  faculty_id:   1, 
  email:        Rails.application.credentials.dig(:admin_user, :email), 
  password:     Rails.application.credentials.dig(:admin_user, :password), 
  confirmed_at: Time.now
)
user.save!

# 開発用データ
if Rails.env.development?
  user1 = User.new(
                    last_name:   '八木',
                    first_name:  '雅斗', 
                    faculty_id:   1, 
                    email:        'sample@example.com', 
                    password:     'password',
                    confirmed_at: Time.now
  )
  user1.save!

  user2 = User.new(
                    last_name:   'invalid', 
                    first_name:  'ユーザー', 
                    faculty_id:   rand(1..17), 
                    email:        'no_confirmed@example.com', 
                    password:     'password',
                    confirmed_at: Time.now
  )
  user2.save!

  30.times do
    sample_user = User.new(
                            first_name:   Gimei.unique.first.kanji,
                            last_name:    Gimei.unique.last.kanji,
                            faculty_id:   rand(1..17),
                            email:        Faker::Internet.unique.email,
                            password:     "password",
                            confirmed_at: Time.now
                          )
    sample_user.save!
  end
  # TODO: 画像をリッチテキストに保存する
  # 20.times do
  #   uploader = ImageUploader.new(:store)
  #   file = File.new(Rails.root.join('app/images/seed/thor.png'))
  #   # upload method is to take an IO-like object on the input
  #   uploaded_file = uploader.upload(file)
  #   Photo.create!(image_data: uploaded_file.to_json)
  # end

  20.times do |n|
    user = User.offset( rand(User.count) ).first
    board = Board.new(
                      title:           "Title#{n}", 
                      abstract:        "overview#{n}",
                      detail:          "<p>#{Faker::Lorem.paragraphs(number: 15).join(' ')}</p>",
                      campus_name_id:  rand(1..4),
                      laboratory:      "lab#{n}",
                      start_day:       Faker::Date.between(from: Date.today, to: Date.today + 29),
                      finish_day:      Faker::Date.between(from: Date.today + 30, to: Date.today + 60),
                      place:           Gimei.address,
                      reward_present:  ["報酬あり", "報酬なし"].sample,
                      reward_content:  "報酬１",
                      required_number: rand(1..100),
                      contact_detail:  Faker::PhoneNumber.cell_phone,
                      public_end_date: Faker::Date.between(from: Date.today + 30, to: Date.today + 60),
                      user_id:         user.id
                      )
    board.save!
  end
end