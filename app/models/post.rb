class Post < ApplicationRecord
  belongs_to :user
  has_many :likes
  has_many :comments

  after_save :post_counter

  def recent_comments
    Comment.limit(5).order(created_at: :desc)
  end

  def post_counter
    user.increment!(:PostsCounter)
  end

  private :post_counter
end
