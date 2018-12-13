class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable

  LOCATIONS = ["Greater Lisbon", "Porto", "New York City", "Chicago", "Dallas", "Yorkshire", "London", "Liverpool", "Dublin", "Toronto", "Vancouver", "Ottawa"]
  GENDERS = %w[Female Male]
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  mount_uploader :photo, PhotoUploader

  has_many :availabilities, dependent: :destroy

  has_many :atteendees, dependent: :destroy
  has_many :meals, through: :atteendees

  has_many :user_interests, dependent: :destroy
  has_many :interests, through: :user_interests

  validates :first_name, presence: true, blank: false
  validates :gender, presence: true, inclusion: { in: GENDERS }
  validates :location, presence: true, inclusion: { in: LOCATIONS }
  validates :age, numericality: { greater_than_or_equal_to: 18 }
end
