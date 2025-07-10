class User < ApplicationRecord
  has_secure_password

  has_many :co_authors, dependent: :destroy

  has_many :proposals, dependent: :destroy
  has_many :collaborating_proposals, through: :co_authors, source: :proposal
end
