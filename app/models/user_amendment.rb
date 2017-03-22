class UserAmendment < ActiveRecord::Base
  belongs_to :user
  belongs_to :amendment

end
