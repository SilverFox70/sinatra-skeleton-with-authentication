require 'bcrypt'
require 'securerandom'

class User < ActiveRecord::Base
  has_many :friends
  validates :slug, uniqueness: true
  validates :email, {presence: true,
                     uniqueness: true,
                     format:
                     {with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/
                    }}

  validates :password_hash, {presence: true} #add confirmation: true
  #validates :pwd_confirmation, presence: true

  # Note about :role field
  # Normally role will be saved as 0 as general users do
  # not have access to modifying this value via the sign-up
  # form.  Implement your own codes as necessary.  In this
  # site a role value of 1 is considered an admin
  before_create :create_slug
  before_save :check_role

  def find_friends
    user_friends = User.friends
    friend_to_user = Friend.where(target_user_id: self.id)
    all_friends = user_friends + friend_to_user
  end

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

  private

  def check_role
    self.role = 0 if self.role == nil
  end

  def create_slug
    self.slug = SecureRandom.hex(6)
  end

end
