class Like < ApplicationRecord
  belongs_to :post
  belongs_to :user

  def likes_counter
    post.increment!(:LikesCounter)
  end
end
