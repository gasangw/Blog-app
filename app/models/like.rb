class Like < ApplicationRecord
  belongs_to :post
  belongs_to :user

  after_save :likes_counter

  def likes_counter
    post.increment!(:LikesCounter)
  end

  private :likes_counter
end
