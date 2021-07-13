# == Schema Information
#
# Table name: boards
#
#  id              :bigint           not null, primary key
#  abstract        :text(65535)      not null
#  contact_detail  :string(255)      not null
#  detail          :text(65535)      not null
#  finish_day      :date             not null
#  laboratory      :string(255)      default(""), not null
#  place           :string(255)      default(""), not null
#  public_end_date :date             not null
#  required_number :integer          unsigned, not null
#  reward_content  :string(255)      default(""), not null
#  reward_present  :boolean          not null
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
    validates :contact_detail,  length: { maximum: 50 }
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

  validates :reward_present, inclusion: { in: [true, false] }
  validate :start_day_is_after_today, on: :create
  validate :finish_day_is_since_start_day

  def start_day_is_after_today
    return if start_day.blank?
    errors.add(:start_day, "は本日以降のものを選択してください")   if start_day < Date.today
  end

  def finish_day_is_since_start_day
    return if finish_day.blank? || start_day.blank?
    errors.add(:finish_day, "は開始日以降のものを選択してください") if finish_day < start_day
  end
end
