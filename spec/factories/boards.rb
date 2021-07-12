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
FactoryBot.define do
  factory :board do
    sequence (:title) { |n| "#{n}実験の募集" }
    sequence (:abstract) { |n| "要約#{n}" }
    sequence (:detail) { |n| "詳細#{n}" }
    sequence (:laboratory) { |n| "#{n}研究室" }
    start_day { "2020-08-23" }
    finish_day { "2020-08-28" }
    sequence (:place) { |n| "インテグ#{n}階" }
    # sequence (:reward_id) { |n| n }
    sequence (:reward_content) { |n| "#{n}０００円" }
    sequence (:required_number) { |n| "1#{n}" }
    sequence (:contact) { |n| "#{n}@ed.ritsumei.ac.jp" }
    endline { "2020-10-01" }
    user
    campus_name
    reward
  end
end
