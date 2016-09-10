class Query < ActiveRecord::Base
  has_many :results
  belongs_to :users

  # extend Slugifiable::ClassMethods
  # include Slugifiable::InstanceMethods

end
