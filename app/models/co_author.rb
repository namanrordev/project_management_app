class CoAuthor < ApplicationRecord
  belongs_to :user
  belongs_to :proposal

  enum status: { invited: "invited", accepted: "accepted", declined: "declined" }
  validates :user_id, uniqueness: { scope: :proposal_id, message: "is already added" }
end
