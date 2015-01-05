class User < ActiveRecord::Base
  attr_accessor :remember_token, :activation_token
  before_save { self.email = email.downcase }
  validates :username, presence: true
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, presence: true, uniqueness: {case_sensitive: false}, format: {with: VALID_EMAIL_REGEX}
  has_secure_password
  has_many :remember_items
  has_many :alert_items

  def User.digest(string)
    cost = ActiveModel::SecurePassword.min_cost ? BCrypt::Engine::MIN_COST :
        BCrypt::Engine.cost
    BCrypt::Password.create(string, cost: cost)
  end

  def User.new_token
    SecureRandom.urlsafe_base64
  end

  #记住登录 本方法已自带update
  def remember
    self.remember_token=User.new_token
    update_attribute(:remember_digest, User.digest(remember_token))
  end

  def authenticated?(attribute, token)
    digest=send("#{attribute}_digest")
    return false if digest.nil?
    BCrypt::Password.new(digest).is_password?(token)
  end


  def forget
    update_attribute(:remember_digest, nil)
  end

  def downcase_email
    self.email = email.downcase
  end

  #创建一个激活码
  def create_activation_digest
    self.activation_token = User.new_token
    self.activation_digest = User.digest(activation_token)
  end

  def activate
    user.update_attribute(:activated, true)
    user.update_attribute(:activated_at, Time.zone.now)
  end
end
