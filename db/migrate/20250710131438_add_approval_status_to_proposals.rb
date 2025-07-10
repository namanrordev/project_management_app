class AddApprovalStatusToProposals < ActiveRecord::Migration[7.1]
  def change
    add_column :proposals, :approval_status, :string, default: "Pending"
  end
end
