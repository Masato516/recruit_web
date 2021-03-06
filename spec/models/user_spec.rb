# == Schema Information
#
# Table name: users
#
#  id                     :bigint           not null, primary key
#  admin                  :boolean          default(FALSE), not null
#  confirmation_sent_at   :datetime
#  confirmation_token     :string(255)
#  confirmed_at           :datetime
#  current_sign_in_at     :datetime
#  current_sign_in_ip     :string(255)
#  deleted_at             :datetime
#  email                  :string(255)      default(""), not null
#  encrypted_password     :string(255)      default(""), not null
#  first_name             :string(255)      not null
#  last_name              :string(255)      not null
#  last_sign_in_at        :datetime
#  last_sign_in_ip        :string(255)
#  remember_created_at    :datetime
#  reset_password_sent_at :datetime
#  reset_password_token   :string(255)
#  sign_in_count          :integer          default(0), not null
#  unconfirmed_email      :string(255)
#  created_at             :datetime         not null
#  updated_at             :datetime         not null
#  faculty_id             :integer          not null
#
# Indexes
#
#  index_users_on_confirmation_token    (confirmation_token) UNIQUE
#  index_users_on_email_and_deleted_at  (email,deleted_at) UNIQUE
#  index_users_on_reset_password_token  (reset_password_token) UNIQUE
#
require 'rails_helper'

RSpec.describe User, type: :model do
  p Reward.all
  p CampusName.all
  p Faculty.all
  it "名前とメールアドレスとパスワードと所属学部・研究科があれば登録できる"

  it "論理削除されていれば名前とメールアドレスとパスワードと所属学部・研究科があれば登録できる"

  it "名前がなければ登録できない"

  it "メールアドレスがなければ登録できない"

  it "メールアドレスが重複していたら登録できない"

  it "パスワードがなければ登録できない"

  it "パスワードが暗号化されているか"

end
