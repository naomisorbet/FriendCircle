class Link < ActiveRecord::Base
  attr_accessible :destination, :name, :post_id

  belongs_to :post
end
