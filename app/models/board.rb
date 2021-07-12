# == Schema Information
#
# Table name: boards
#
#  id             :bigint           not null, primary key
#  abstract       :text(65535)
#  charge         :string(255)
#  contact        :string(255)
#  detail         :text(65535)
#  endline        :date
#  finish_day     :date
#  laboratory     :string(255)
#  number         :integer
#  place          :string(255)
#  reward_content :string(255)
#  start_day      :date
#  title          :string(255)
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
#  campus_name_id :integer
#  reward_id      :integer
#  user_id        :integer
#
class Board < ApplicationRecord
  # ActiveHashの関連付け
  extend ActiveHash::Associations::ActiveRecordExtensions
  
  belongs_to :campus_name
  belongs_to :reward
  belongs_to :user
end
