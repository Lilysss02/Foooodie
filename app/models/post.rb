class Post < ApplicationRecord
  belongs_to :price
  belongs_to :user
  has_many :favorites, dependent: :destroy
  enum status: { report: 0, list: 1 }
  has_many_attached :images

  validates :title, presence: :true, length: { maximum: 50 }
  validates :hashname, presence: true, length: { maximum: 99 }

  def favorited_by?(user)
    favorites.where(user_id: user.id).exists?
  end

  has_and_belongs_to_many :tags

  after_create do
  	post = Post.find_by(id: self.id)
  	hashtags = self.body.scan(/[#＃][\w\p{Han}ぁ-ヶｦ-ﾟー]+/)
  	hashtags.uniq.map do |hashtag|
  		tag = Tag.find_or_create_by(name: hashtag.downcase.delete('#'))
  		post.tags << tag
  	end
  end

  before_update do
  	post = Post.find_by(id: self.id)
  	post.tags.clear
  	hashtags = self.body.scan(/[#＃][\w\p{Han}ぁ-ヶｦ-ﾟー]+/)
  	hashtags.uniq.map do |hashtag|
  		tag = Tag.find_or_create_by(name: hashtag.downcase.delete('#'))
  		post.tags << tag
  	end
  end

end
