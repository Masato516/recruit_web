class User < ApplicationRecord
  attr_accessor :firstName, :lastName

  acts_as_paranoid
  validates :email, uniqueness: { scope: :deleted_at }

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, 
         :registerable,
         :recoverable,
         :rememberable,
         :validatable,
         :confirmable

  has_many :boards, dependent: :destroy
  belongs_to :faculty
  before_create :join_name

  def join_name
    self.name = "#{firstName} #{lastName}"
  end
end
