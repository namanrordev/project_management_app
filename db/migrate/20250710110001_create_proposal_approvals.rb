class CreateProposalApprovals < ActiveRecord::Migration[7.1]
  def change
    create_table :proposal_approvals do |t|
      t.references :proposal, null: false, foreign_key: true
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
