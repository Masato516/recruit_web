# == Schema Information
#
# Table name: boards
#
#  id              :bigint           not null, primary key
#  abstract        :text(65535)      not null
#  contact         :string(255)      not null
#  detail          :text(65535)      not null
#  finish_day      :date             not null
#  laboratory      :string(255)      not null
#  place           :string(255)      default("")
#  public_end_date :date             not null
#  required_number :integer          unsigned, not null
#  reward_content  :string(255)      default("報酬はありません"), not null
#  reward_present  :boolean
#  start_day       :date             not null
#  title           :string(255)      not null
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#  campus_name_id  :integer          unsigned, not null
#  user_id         :integer          unsigned, not null
#
class Board < ApplicationRecord
  # ActiveHashの関連付け
  extend ActiveHash::Associations::ActiveRecordExtensions
  
  belongs_to :campus_name
  belongs_to :user

  with_options presence: true do
    validates :abstract,        length: { maximum: 15 }
    validates :contact,         length: { maximum: 50 }
    validates :detail
    validates :public_end_date
    validates :finish_day
    validates :laboratory
    validates :required_number, length: { maximum: 100 }
    validates :place,           length: { maximum: 100 }
    validates :reward_content
    validates :start_day
    validates :title,           length: { maximum: 50 }
    validates :reward_present
  end

  enum reward_present: {
    "報酬あり": true,
    "報酬なし": false
  }
end
