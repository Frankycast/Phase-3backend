class CreateScores < ActiveRecord::Migration[5.2]
  def change
    create_table :scores do |t| 
      t.integer :score_val
      t.references :user
    end
  end
end
