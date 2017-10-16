class AddForeignKeysToVotes < ActiveRecord::Migration[5.1]
  def change
    change_table :votes do |t|
      t.references :user, foreign_key: true
      t.references :work, foreign_key: true
    end
  end
end
