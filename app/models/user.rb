class User < ActiveRecord::Base
  has_many :amendments
  has_many :questions
  has_many :comments

  has_secure_password # --uses bcrypt-ruby automatically handles the storage and generation of salts for you
  validates :username, :email, uniqueness: true
  validates :username, :email, presence: true
  validate  :email, :email_format


  def email_format
    unless email =~ /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i
      errors.add(:email, "email address is in the wrong format")
    end
  end
end
