class User < ApplicationRecord
  has_many :votes

  def upvote(work_id)
    work = Work.find(work_id)
    vote = Vote.new(work: work, user: self)
    vote.save
  end
end
