class User < ApplicationRecord
  attr_accessor :firstName, :lastName
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :confirmable

  has_many :boards
  belongs_to :faculty

  before_create :create_name
  def create_name
    self.name = "#{firstName} #{lastName}"
  end
end
