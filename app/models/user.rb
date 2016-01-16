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

  def get_friend_records
    user_friends = self.friends
    friend_to_user = Friend.where(target_user_id: self.id)
    all_friends = user_friends | friend_to_user
  end

  def connections
    all_friends = get_friend_records
    get_friends(all_friends)
  end

  def _2nd_connections
    secondaries = []
    contacts = self.get_friend_records
    contacts.each do |contact|
      if contact.user_id != self.id
        friend_id = contact.user_id
      else
        friend_id = contact.target_user_id
      end
      connect_thru = User.find(friend_id)
      secondaries << connect_thru.connections
    end
    # get_friends(secondaries)
    secondaries
  end

  def get_friends(all_friends)
    user_contacts = []
    all_friends.each do |friend|
      user_contacts << User.find(friend.user_id) if friend.user_id != self.id
      user_contacts << User.find(friend.target_user_id) if friend.target_user_id != self.id
    end
    user_contacts
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
