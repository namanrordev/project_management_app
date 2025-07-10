class CreateCoAuthors < ActiveRecord::Migration[7.1]
  def change
    create_table :co_authors do |t|
      t.references :user, null: false, foreign_key: true
      t.references :proposal, null: false, foreign_key: true
      t.string :status

      t.timestamps
    end
  end
end
