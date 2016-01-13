class User < ActiveRecord::Base

  validates :email, {presence: true,
                     uniqueness: true,
                     format
                     {with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/
                    }}

  validates :pwd_hash, {presence: true} #add confirmation: true
  #validates :pwd_confirmation, presence: true

  def self.authenticate(email, password)
    # if email and password correspond to a valid user,
    # return that user, otherwise return nil
  end

  def password
    @password ||= BCrypt::Password.new(pwd_hash)
  end

  def password=(new_password_plaintext)
    @password = BCrypt::Password.create(new_password_plaintext)
    self.pwd_hash = @password.to_s
  end
end
