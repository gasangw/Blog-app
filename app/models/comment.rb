class Comment < ApplicationRecord
  belongs_to :user
  belongs_to :post

  after_save :comment_counter
  validates :Text, presence: true

  def comment_counter
    post.increment!(:CommentsCounter)
  end

  private :comment_counter
end
