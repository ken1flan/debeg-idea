class Comment < ActiveRecord::Base
  belongs_to :idea
  belongs_to :user
  has_many :likes, as: :likable

  validates :body, length: { maximum: 1000 }, presence: true
end
