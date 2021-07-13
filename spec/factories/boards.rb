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
FactoryBot.define do
  factory :board do
    sequence (:title) { |n| "#{n}実験の募集" }
    sequence (:abstract) { |n| "要約#{n}" }
    sequence (:detail) { |n| "詳細#{n}" }
    sequence (:laboratory) { |n| "#{n}研究室" }
    start_day { "2020-08-23" }
    finish_day { "2020-08-28" }
    sequence (:place) { |n| "インテグ#{n}階" }
    # sequence (:reward_present) { |n| n }
    sequence (:reward_content) { |n| "#{n}０００円" }
    sequence (:required_number) { |n| "1#{n}" }
    sequence (:contact_detail) { |n| "#{n}@ed.ritsumei.ac.jp" }
    public_end_date { "2020-10-01" }
    user
    campus_name
    reward
  end
end
