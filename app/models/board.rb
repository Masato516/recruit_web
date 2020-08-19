class Board < ApplicationRecord
  belongs_to :campus_name
  belongs_to :reward
  belongs_to :user
end
