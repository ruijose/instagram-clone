class Post < ActiveRecord::Base
  validates :image, presence: true

  has_attached_file :image, styles: { :medium => "640x" }
  validates_attachment_content_type :image, :content_type => /\Aimage\/.*\Z/
  belongs_to :user
  has_many   :relationships, :foreign_key => "like_receiver_id"
  has_many   :like_receiver,         :through     => :relationships
end
