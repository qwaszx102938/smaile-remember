class User < ActiveRecord::Base
before_save { self.email = email.downcase }
validates :username, presence: true
validates :password, presence: true
VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
validates :email, presence: true,unique: true,uniqueness: { case_sensitive: false },format:{with:VALID_EMAIL_REGEX}
end
