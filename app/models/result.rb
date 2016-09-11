class Result < ActiveRecord::Base
  has_many :users, through: :questions
  belongs_to :question

  # extend Slugifiable::ClassMethods
  # include Slugifiable::InstanceMethods

end
