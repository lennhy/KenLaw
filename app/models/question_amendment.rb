class QuestionAmendment < ActiveRecord::Base
  belongs_to :amendments
  belongs_to :questions
end
