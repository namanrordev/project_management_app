class Proposal < ApplicationRecord
  belongs_to :user
  has_many :co_authors, dependent: :destroy
  has_many :coauthor_users, through: :co_authors, source: :user
end
