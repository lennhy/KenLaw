class Comment < ActiveRecord::Base #JOIN TABLE
  belongs_to :user
  belongs_to :question
  
  validates :content, presence: true

end
