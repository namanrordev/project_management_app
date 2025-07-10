class CreateProposalCosts < ActiveRecord::Migration[7.1]
  def change
    create_table :proposal_costs do |t|
      t.references :proposal, null: false, foreign_key: true
      t.string :category
      t.text :description
      t.decimal :amount

      t.timestamps
    end
  end
end
