class QuestionAmendment < ActiveRecord::Base
  belongs_to :question
  belongs_to :amendment
end
