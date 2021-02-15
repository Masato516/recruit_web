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
    sequence (:number) { |n| "1#{n}" }
    charge { '八木' }
    sequence (:contact) { |n| "#{n}@ed.ritsumei.ac.jp" }
    endline { "2020-10-01" }
    user
    campus_name
    reward
  end
end
