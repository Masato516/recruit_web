user = User.new(
  first_name:  '八木', 
  last_name:   '雅斗', 
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
                    first_name:  '八木', 
                    last_name:   '雅斗', 
                    faculty_id:   1, 
                    email:        'sample@example.com', 
                    password:     'password',
                    confirmed_at: Time.now
  )
  user1.save!

  user2 = User.new(
                    first_name:  'invalid', 
                    last_name:   'ユーザー', 
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
    user = User.sample
    title:           "Title#{n}", 
    abstract:        "overview#{n}",
    detail:          "#{photo}<p>#{Faker::Lorem.paragraphs(number: 15).join(' ')}</p>",
    campus_name_id:  rand(1..4),
    laboratory:      "lab#{n}",
    start_day:       Faker::Date.between(from: '2021-01-01', to: '2021-07-01'),
    finish_day:      Faker::Date.forward(days: 50),
    place:           Gimei.address,
    reward_present:  [true, false].sample,
    reward_content:  "報酬１",
    required_number: (1..100).sample,
    charge:          user.name,
    contact:         Faker::PhoneNumber.cell_phone,
    endline:         Faker::Date.forward(days: 30),
    user_id:         user.id
  end
end