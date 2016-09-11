class Question < ActiveRecord::Base
  has_many :results
  belongs_to :user

  # extend Slugifiable::ClassMethods
  # include Slugifiable::InstanceMethods

end
