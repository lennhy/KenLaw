class Amendment < ActiveRecord::Base
  has_many :users, through: :questions
  has_many :question_amendments
  has_many :questions, through: :question_amendments

  end
  # -- create objects for every amendment key value pair to seed the databse with
  def self.seed_databse(params)
    params.each do |name,content|
     	self.create(name: name, content: content)
      self
    end
  end

end
