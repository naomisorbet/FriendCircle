require "user"
class Post < ActiveRecord::Base
  attr_accessible :body, :user_id, :friend_circle_ids, :link_attributes
  validates :user_id, :body, :presence => true

  belongs_to :user
  has_many :post_shares
  has_many :friend_circles, :through => :post_shares, :source => :friend_circle
  has_many :links

  accepts_nested_attributes_for :links, :reject_if => :all_blank
end
