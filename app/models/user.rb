class User < ActiveRecord::Base
  def self.authenticate(email, password)
    # if email and password correspond to a valid user,
    # return that user, otherwise return nil
  end

  validates :email, {presence: true, uniqueness: true, format {with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/}}

  validates :pwd, {presence: true, confirmation: true}
  validates :pwd_confirmation, presence: true
end
