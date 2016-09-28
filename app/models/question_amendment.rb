class QuestionAmendment < ActiveRecord::Base
  belongs_to :questions
  belongs_to :amendments
end
