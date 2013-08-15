class FriendCircleMembership < ActiveRecord::Base
  attr_accessible :friend_circle_id, :member_id
  validates  :friend_circle_id, :member_id, :presence => true

  belongs_to :friend_circle

  belongs_to :member, :class_name  => "User"
end
