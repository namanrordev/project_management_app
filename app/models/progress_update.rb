class ProgressUpdate < ApplicationRecord
  belongs_to :proposal
  belongs_to :user

  validates :title, :status, :percent_done, presence: true
  validates :percent_done, numericality: { greater_than_or_equal_to: 0, less_than_or_equal_to: 100 }
end
