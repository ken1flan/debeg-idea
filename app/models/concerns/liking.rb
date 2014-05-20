module Liking
  extend ActiveSupport::Concern

  included do
    has_many :likes, as: :likable

    def like_count
      self.likes.active.count
    end

    def like(user)
      user_like = self.likes.find_by(user: user)
      if user_like
        user_like.toggle!
      else
        user_like = self.likes.create(user: user)
      end
      user_like
    end
  end
end
