FactoryBot.define do
  factory :user do
    sequence(:id) { |n| n }
    sequence(:name) { |n| "ユーザー#{n}" }
    # name { 'テストユーザー' }
    sequence(:email) { |n| "#{n}@ed.ritsumei.ac.jp" }
    # email {'test1@ed.ritsumei.ac.jp'}
    password { 'password' }
    faculty
  end
end
