class Proposal < ApplicationRecord
  has_paper_trail on: [:update], ignore: [:updated_at]

  belongs_to :user
  has_many :co_authors, dependent: :destroy
  has_many :coauthor_users, through: :co_authors, source: :user
  has_many :approvals, class_name: "ProposalApproval", dependent: :destroy
  has_many :approved_users, through: :approvals, source: :user
  has_many :proposal_costs, dependent: :destroy
  validates :feasibility_score, numericality: { allow_nil: true, greater_than_or_equal_to: 0, less_than_or_equal_to: 100 }

  def total_cost
    proposal_costs.sum(:amount)
  end

  def approval_status
    # Consider both invited and accepted co-authors
    required_user_ids = [user.id] + co_authors.where(status: %w[invited accepted]).pluck(:user_id)
    return "Not Ready" if required_user_ids.empty?

    approved_user_ids = approvals.pluck(:user_id)

    if (approved_user_ids & required_user_ids).uniq.sort == required_user_ids.uniq.sort
      "Approved"
    else
      "Pending"
    end
  end

  def approved_by_all_required?
    required_approvers = [user.id] + co_authors.where(status: %w[invited accepted]).pluck(:user_id)
    (required_approvers - approvals.pluck(:user_id)).empty?
  end
end
