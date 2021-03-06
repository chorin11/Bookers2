class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :post_images, dependent: :destroy
  has_many :books, dependent: :destroy
  has_many :book_comments, dependent: :destroy
  has_many :favorites, dependent: :destroy
  has_many :relationships
  has_many :followings, through: :relationships, source: :follow
  has_many :reverse_of_relationships, class_name: 'Relationship', foreign_key: 'follow_id'
  has_many :followers, through: :reverse_of_relationships, source: :user
  attachment :profile_image

  validates :name, presence: true, length: {in: 2..20}
  validates :introduction, length: { maximum: 50 }

  def self.search(search,word)
		if search == "forward_match"
			@user = User.where("name LIKE?","#{word}%")
		elsif search == "backward_match"
			@user = User.where("name LIKE?","%#{word}")
		elsif search == "perfect_match"
			@user = User.where("#{word}")
		elsif search == "partial_match"
			@user = User.where("name LIKE?","%#{word}%")
		else
			@user = User.all
		end
	end
end