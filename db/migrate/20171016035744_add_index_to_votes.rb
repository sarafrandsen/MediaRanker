class AddIndexToVotes < ActiveRecord::Migration[5.1]
  def change
    add_index :votes, [:user_id, :work_id], unique: true
  end
end
