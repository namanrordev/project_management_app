class Proposal < ApplicationRecord
  has_paper_trail on: [:update], ignore: [:updated_at]

  belongs_to :user
  has_many :co_authors, dependent: :destroy
  has_many :coauthor_users, through: :co_authors, source: :user
end
