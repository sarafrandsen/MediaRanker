class User < ApplicationRecord
  has_many :votes

  def upvote(work_id)
    puts ">>>>> ya voted fer #{work_id}"
  end
end
