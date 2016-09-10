class Query < ActiveRecord::Base
  has_many :querys
  has_many :results, through: :querys

  has_secure_password # --uses bcrypt-ruby automatically handles the storage and generation of salts for you

  # extend Slugifiable::ClassMethods
  # include Slugifiable::InstanceMethods

end
