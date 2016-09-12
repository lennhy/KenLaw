class Amendment < ActiveRecord::Base
  has_many :users, through: :questions
  belongs_to :question

  # extend Slugifiable::ClassMethods
  # include Slugifiable::InstanceMethods

  def self.find_by_description(search)
    # bill = search.split(" ").join(", ")
    self.any? do |amendment, content|
      if content.match(/#{search}/)
        binding.pry
          content
      end

    end
  end

  # -- create objects for every amendment key value pair to seed the databse with
  def self.seed_databse(params)

    params.each do |name,content|
     	self.create(content: content)
      self
    end

  end

end
