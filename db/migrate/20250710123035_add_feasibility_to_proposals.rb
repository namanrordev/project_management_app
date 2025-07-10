class AddFeasibilityToProposals < ActiveRecord::Migration[7.1]
  def change
    add_column :proposals, :feasibility_score, :integer
    add_column :proposals, :review_comment, :text
  end
end
