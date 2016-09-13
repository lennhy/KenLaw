class Question < ActiveRecord::Base
  has_many :amendments
  belongs_to :user

  # extend Slugifiable::ClassMethods
  # include Slugifiable::InstanceMethods


end
