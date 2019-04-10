class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_one_attached :image
  has_many :posts
  has_many :favorites, dependent: :destroy

  # フォローできるユーザを取り出す記述（user.following_relationships.followingsできるように）
  has_many :following_relationships, foreign_key: "follower_id", class_name: "Relationship", dependent: :destroy
  has_many :followings, through: :following_relationships

  # フォローしているユーザを取り出す
  has_many :follower_relationships, foreign_key: "following_id", class_name: "Relationship", dependent: :destroy
  has_many :followers, through: :follower_relationships

  # フォローしているか調べる
  def following?(other_user)
    following_relationships.find_by(following_id: other_user.id)
  end

  # フォローする
  def follow!(other_user)
    following_relationships.create!(following_id: other_user.id)
  end

  # フォローを解除する
  def unfollow!(other_user)
    following_relationships.find_by(following_id: other_user.id).destroy
  end
end
