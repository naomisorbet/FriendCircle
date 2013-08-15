class PostShare < ActiveRecord::Base
  attr_accessible :post_id, :friend_circle_id
  validates :post_id, :friend_circle_id, :presence => true

  belongs_to :post

  belongs_to :friend_circle

end
