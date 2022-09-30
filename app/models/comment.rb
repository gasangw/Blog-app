class Comment < ApplicationRecord
  belongs_to :user
  belongs_to :post

  validates :Text, presence: true

  def comment_counter
    post.increment!(:CommentsCounter)
  end
end
