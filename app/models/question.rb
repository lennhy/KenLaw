class Question < ActiveRecord::Base
  has_many :amendments
  belongs_to :user


end
