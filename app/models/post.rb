class Post < ApplicationRecord
  belongs_to :price
  belongs_to :user
  has_many :favorites, dependent: :destroy
  has_many_attached :images

  enum status: %i(published draft)

  validates :title, presence: :true, length: { maximum: 50 }
  validates :body, length: { maximum: 1000 }
  validates :shop_map, presence: :true
  validate :images_type

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

  private

  def images_type
    if images.attached? == false
      errors.add(:images, "を選択してください")
    end

    if images.each do |image|
        if !image.content_type.in?(%('image/jpeg image/jpg image/gif image/png'))
          errors.add(:images, 'ファイル形式はJPEG,JPG,GIF,PNGのみです')
        end
      end
    end
  end

end
