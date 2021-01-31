FactoryBot.define do
  factory :user do
    name { 'テストユーザー' }
    email {'test1@ed.ritsumei.ac.jp'}
    password { 'password' }
    faculty
  end
end
