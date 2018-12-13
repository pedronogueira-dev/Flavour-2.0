class Attendee < ApplicationRecord
  ATTENDEE_STATUS = %w[Invited Confirmed Rejected]

  belongs_to :user
  belongs_to :meal

  validates :status, presence: true, inclusion: { in: ATTENDEE_STATUS }
end
