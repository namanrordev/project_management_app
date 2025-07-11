class ProposalCost < ApplicationRecord
  belongs_to :proposal

  validates :description, :amount, presence: true
  validates :amount, numericality: { greater_than_or_equal_to: 0 }
end
