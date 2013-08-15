require 'bcrypt'

class User < ActiveRecord::Base
  attr_accessible :password, :username, :session_token
  validates :session_token, :username, :uniqueness => true
  validates :password_digest, :username, :session_token, :presence => true

  has_many :friend_circles

  has_many :posts

  has_many :friends,
    :through => :friend_circles,
    :source => :member

  def password=(password_input)
    @password_digest = BCrypt::Password.create(password_input)
    self.password_digest = @password_digest
  end

  def password
    @password ||= BCrypt::Password.new(password_digest)
  end

  def reset_session_token!
    reset_session_token

    until self.save
      reset_session_token
    end
  end

  def reset_session_token
    self.session_token = SecureRandom::urlsafe_base64
  end
end
