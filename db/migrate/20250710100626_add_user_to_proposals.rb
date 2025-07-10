class AddUserToProposals < ActiveRecord::Migration[7.1]
  def change
    add_reference :proposals, :user, null: false, foreign_key: true
  end
end
