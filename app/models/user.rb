class User < ApplicationRecord
  has_secure_password

  has_many :co_authors, dependent: :destroy

  has_many :proposals, dependent: :destroy
  has_many :collaborating_proposals, through: :co_authors, source: :proposal
  has_many :approvals, class_name: "ProposalApproval", dependent: :destroy
  has_many :approved_proposals, through: :approvals, source: :proposal

  validates :email, uniqueness: { message: "is already added" }

  def admin?
    self.admin
  end
end
