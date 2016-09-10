class Result < ActiveRecord::Base
  has_many :users, through: :querys
  belongs_to :query

  # extend Slugifiable::ClassMethods
  # include Slugifiable::InstanceMethods

end
