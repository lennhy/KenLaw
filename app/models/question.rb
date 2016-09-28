class Question < ActiveRecord::Base
  belongs_to :user
  has_many :question_amendments
  has_many :amendments, through: :question_amendments
end
