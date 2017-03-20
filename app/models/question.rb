class Question < ActiveRecord::Base
  include CSRFValidation::InstanceMethods

  belongs_to :user
  has_many :comments

  validates :content, presence: true
  validate  :content, :no_characters

end
