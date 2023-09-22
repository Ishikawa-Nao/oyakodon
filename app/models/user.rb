class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :worlds, dependent: :destroy
  validates :name, presence: true
  validates :profile, length: { maximum: 200 }

  has_many :likes, dependent: :destroy
  has_many :liked_worlds, through: :likes, source: :world

  has_many :comments, dependent: :destroy

  def already_liked?(world)
    self.likes.exists?(world_id: world.id)
  end

end
