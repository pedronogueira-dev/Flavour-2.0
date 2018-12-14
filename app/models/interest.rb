class Interest < ApplicationRecord
  has_many :user_interests, dependent: :destroy
  has_many :users, through: :user_interests # TODO ADD CONDITION -> ONLY ACTIVE user_interests
end
