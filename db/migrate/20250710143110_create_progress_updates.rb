class CreateProgressUpdates < ActiveRecord::Migration[7.1]
  def change
    create_table :progress_updates do |t|
      t.string :title
      t.text :description
      t.string :status
      t.integer :percent_done
      t.references :user, null: false, foreign_key: true
      t.references :proposal, null: false, foreign_key: true

      t.timestamps
    end
  end
end
