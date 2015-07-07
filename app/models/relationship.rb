class Relationship < ActiveRecord::Base
  belongs_to :like_receiver, class_name: "Post"
  belongs_to :like_giver, class_name: "User"
end
