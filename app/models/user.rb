class User < ActiveRecord::Base
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_attached_file :avatar, :styles => { :medium => "300x300>", :thumb => "100x100#" }
  validates_attachment_content_type :avatar, :content_type => /\Aimage\/.*\Z/
  has_many :posts,      :dependent => :destroy
  has_many :likes,      :foreign_key => "who_liked_id"
  has_many :comments,   :dependent => :destroy
  has_many :liked_pics, through: :likes

  def like(post)
    self.likes.create(:liked_pics_id => post.id)
  end
end
