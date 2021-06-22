class CreateScores < ActiveRecord::Migration[5.2]
  def change
    create_table :scores do |t| 
      t.integer :scores
      t.reference :user
    end
  end
end
