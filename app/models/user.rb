require 'bcrypt'

class User < ActiveRecord::Base
  attr_accessible :email, :password, :user_name, 
                  :city, :state, :first_name, :last_name,
                  :filepicker_url, :description

  has_many :places, foreign_key: :owner_id
  has_many :requests, class_name: "PlaceRentalRequest"
  has_many :recieved_messages, class_name: "Message", foreign_key: :reciever_id
  has_many :sent_messages, class_name: "Message", foreign_key: :sender_id

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
