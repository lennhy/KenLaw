class Query < ActiveRecord::Base
  has_many :querys
  has_many :results, through: :querys

  has_secure_password # -- has special meta programming methods

  # extend Slugifiable::ClassMethods
  # include Slugifiable::InstanceMethods

end
