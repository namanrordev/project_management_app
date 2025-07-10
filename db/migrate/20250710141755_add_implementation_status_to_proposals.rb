class AddImplementationStatusToProposals < ActiveRecord::Migration[7.1]
  def change
    add_column :proposals, :implementation_status, :string, default: "approved"
  end
end
