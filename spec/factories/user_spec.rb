# require 'rails_helper'
#
# RSpec.describe User, type: :model do
#   pending "add some examples to (or delete) #{__FILE__}"
# end

FactoryBot.define do
  factory :user do
    name { 'テストユーザー' }
    email {'test1@ed.ritsumei.ac.jp'}
    password { 'password' }
    faculty
  end
end
