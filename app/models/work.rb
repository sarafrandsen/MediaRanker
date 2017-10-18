class Work < ApplicationRecord
  has_many :votes

  def get_upvotes
    return Vote.where(work: self)
  end
end
