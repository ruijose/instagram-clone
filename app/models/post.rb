class Post < ActiveRecord::Base
  validates :image,   presence: true
  validates :caption, presence: true
  has_attached_file :image, styles: { :medium => "640x" }
  validates_attachment_content_type :image, :content_type => /\Aimage\/.*\Z/
  belongs_to :user
  has_many :likes, :foreign_key => "liked_pics_id"
  has_many :who_liked, :through => :likes
  has_many :comments
end
