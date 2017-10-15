class Work < ApplicationRecord
  has_many :votes, dependent: :destroy
  has_many :users, through: :votes

  validates :category, presence: {message: "You need a category!"}
  validates :title, presence: {message: "You need a title!"}
  validates :creator, presence: {message: "You need a creator!"}
end
