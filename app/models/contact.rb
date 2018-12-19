class Contact < ApplicationRecord
  belongs_to :user

  validates :contact, presence: true, blank: false
end
