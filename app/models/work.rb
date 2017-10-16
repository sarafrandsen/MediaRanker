class Work < ApplicationRecord
  has_many :votes, dependent: :destroy
  has_many :users, through: :votes

  def self.spotlight
    # number 1 everything
  end

  def self.top_10(work)
    # top 10 lists
  end
end
