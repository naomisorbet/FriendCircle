class FriendCircle < ActiveRecord::Base
  attr_accessible :name, :user_id, :member_ids

  belongs_to :user

  has_many :friend_circle_memberships
  has_many :members, :through => :friend_circle_memberships, :source => :member
  has_many :post_shares
  has_many :posts, :through => :post_shares, :source => :post

end
