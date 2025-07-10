class CoAuthor < ApplicationRecord
  belongs_to :user
  belongs_to :proposal

  enum status: { invited: "invited", accepted: "accepted", declined: "declined" }
end
