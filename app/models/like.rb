class Like < ActiveRecord::Base
  belongs_to :likable, polymorphic: true
  belongs_to :user

  scope :active, -> { where(deleted: false) }

  def toggle!
    self.deleted = self.deleted ? false : true
    self.save!
  end
end
