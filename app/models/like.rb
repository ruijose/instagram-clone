class Like < ActiveRecord::Base
  belongs_to :who_liked,  :class_name => "User"
  belongs_to :liked_pics, :class_name => "Post"
end
