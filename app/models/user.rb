require 'bcrypt'

class User < ActiveRecord::Base
  attr_accessible :email, :password, :user_name

  has_many :places, foreign_key: :owner_id
  has_many :requests, class_name: "PlaceRentalRequest"

  def password=(password)
    self.password_digest = BCrypt::Password.create(password)
  end

  def verify_password(password)
    BCrypt::Password.new(self.password_digest) == password
  end

  def reset_session_token!
    self.session_token = SecureRandom::base64(32)
    self.save

    self.session_token
  end
end
