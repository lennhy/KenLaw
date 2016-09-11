class User < ActiveRecord::Base
  has_many :questions
  has_many :results, through: :questions

  has_secure_password # --uses bcrypt-ruby automatically handles the storage and generation of salts for you

  # extend Slugifiable::ClassMethods
  # include Slugifiable::InstanceMethods

end
