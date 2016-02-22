class User < ActiveRecord::Base
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_attached_file :avatar, :styles => { :medium => "300x300>", :thumb => "100x100#" }
  validates_attachment_content_type   :avatar, :content_type => /\Aimage\/.*\Z/
  has_many :posts,                    :dependent => :destroy
  has_many :likes,                    :foreign_key => "who_liked_id"
  has_many :comments,                 :dependent => :destroy
  has_many :liked_pics,               through: :likes
  has_many :relationships,            foreign_key: "follower_id", dependent: :destroy
  has_many :followed_users,           through: :relationships, source: :followed
  has_many :reverse_relationships,    foreign_key: "followed_id",
                                      class_name:  "Relationship",
                                      dependent:   :destroy
  has_many :followers,                through: :reverse_relationships, source: :follower

  def like(post)
    self.likes.create(:liked_pics_id => post.id)
  end

  def following?(other_user)
    self.relationships.find_by_followed_id(other_user.id)
  end

  def follow!(other_user)
    self.relationships.create!(followed_id: other_user.id)
  end

  def unfollow!(other_user)
    self.relationships.find_by_followed_id(other_user.id).destroy
  end

  def self.search(query)
    where("email like ?", "%#{query}%") 
  end

  def username
    self.email.split("@")[0] #change later
  end
end
