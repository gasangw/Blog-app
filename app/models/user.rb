class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :confirmable
  has_many :posts
  has_many :likes
  has_many :comments
  before_validation :default_values

  validates :Name, presence: true
  validates :PostsCounter, presence: true, numericality: { only_integer: true, greater_than_or_equal_to: 0 }
  def default_values
    self.PostsCounter = 0
    self.Photo = 'https://img.myloview.com/posters/social-media-user-icon-default-avatar-profile-image-400-251200036.jpg'
  end

  def recent_posts
    Post.limit(3).order(created_at: :desc)
  end
end
