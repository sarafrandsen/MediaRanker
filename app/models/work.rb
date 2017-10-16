class Work < ApplicationRecord
  has_many :votes, dependent: :destroy
  has_many :users, through: :votes

  validates :title, presence: true
  validates :title, uniqueness: { scope: [:category]}
  validates :category, presence: true
  validates :publication_year, presence: true
  validates :creator, presence: true

  def self.spotlight
    # number 1 everything
  end

  def self.top_10(work)
    # top 10 lists
  end
end
