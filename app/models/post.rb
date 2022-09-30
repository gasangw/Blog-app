class Post < ApplicationRecord
  belongs_to :user
  has_many :likes
  has_many :comments

  after_save :post_counter

  validates :Title, presence: true, length: { in: 0..250 }
  validates :CommentsCounter, presence: true, numericality: { only_integer: true, greater_than_or_equal_to: 0 }
  validates :LikesCounter, presence: true, numericality: { only_integer: true, greater_than_or_equal_to: 0 }

  def recent_comments
    Comment.limit(5).order(created_at: :desc)
  end

  def post_counter
    user.increment!(:PostsCounter)
  end

  private :post_counter
end
