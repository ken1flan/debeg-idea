class Comment < ActiveRecord::Base
  include Liking

  belongs_to :idea
  belongs_to :user

  validates :body, length: { maximum: 1000 }, presence: true
end
