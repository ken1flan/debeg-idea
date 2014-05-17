class Idea < ActiveRecord::Base
  has_many :comments
  belongs_to :user
  has_many :likes, as: :likable

  validates :title, length: { maximum: 100 }, presence: true
end
