class User < ApplicationRecord
  has_many :posts
  has_many :likes
  has_many :comments

  validates :Name, presence: true
  validates :PostsCounter, presence: true, numericality: { only_integer: true, greater_than_or_equal_to: 0 }
  def recent_posts
    Post.limit(3).order(created_at: :desc)
  end
end
