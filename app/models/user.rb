require 'bcrypt'
class User < ActiveRecord::Base

  validates :email, {presence: true,
                     uniqueness: true,
                     format:
                     {with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/
                    }}

  validates :password_hash, {presence: true} #add confirmation: true
  #validates :pwd_confirmation, presence: true

  def password
    @password ||= BCrypt::Password.new(password_hash)
  end

  def password=(new_password_plaintext)
    @password = BCrypt::Password.create(new_password_plaintext)
    self.password_hash = @password.to_s
  end

  def authenticate(email, password_plaintext)
    # if email and password correspond to a valid user,
    # return that user, otherwise return
    # currently only checks for valid password
    email_match = true if self.email == email
    password_match = true if self.password == password_plaintext
    return email_match && password_match
  end

  def is_admin?
    return self.role == 1
  end

end
