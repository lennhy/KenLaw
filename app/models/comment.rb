class Comment < ActiveRecord::Base #JOIN TABLE
  include CSRFValidation::InstanceMethods

  belongs_to :user
  belongs_to :question

  validates :content, presence: true
  validate  :content, :no_characters


end
