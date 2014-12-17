class Translation 

#trans_translation  翻译结果 数组
#trans_translation  翻译结果 数组
#trans_base    音标  hash

  attr_accessor :trans_name, :trans_translation,
  

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
