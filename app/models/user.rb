class User < ActiveRecord::Base
  has_many :amendments
  has_many :questions
  has_many :comments
  
  has_secure_password # --uses bcrypt-ruby automatically handles the storage and generation of salts for you

end
