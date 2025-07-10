class ProposalApproval < ApplicationRecord
  belongs_to :proposal, touch: true
  belongs_to :user

  validates :user_id, uniqueness: { scope: :proposal_id }
end
