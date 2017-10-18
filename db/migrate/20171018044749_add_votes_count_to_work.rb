class AddVotesCountToWork < ActiveRecord::Migration[5.1]
  def change
    add_column :works, :votes_count, :integer, default: 0
  end
end
