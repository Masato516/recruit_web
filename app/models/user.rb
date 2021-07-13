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
class User < ApplicationRecord
  # ActiveHashの関連付け
  extend ActiveHash::Associations::ActiveRecordExtensions
  # 論理削除の実装
  acts_as_paranoid

  with_options presence: true do
    validates :first_name, length: { maximum: 15 }
    validates :last_name,  length: { maximum: 15 }
    validates :faculty_id
    validates :email,      uniqueness: { scope: :deleted_at }
  end

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, 
         :registerable,
         :recoverable,
         :rememberable,
         :validatable,
         :confirmable

  has_many :boards
  belongs_to :faculty

  def name
    first_name + " " + last_name
  end
end
