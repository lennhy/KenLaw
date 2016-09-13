class Amendment < ActiveRecord::Base
  has_many :users, through: :questions
  belongs_to :question

  # extend Slugifiable::ClassMethods
  # include Slugifiable::InstanceMethods

  def self.find_by_description(search)
    # bill = search.split(" ").join(", ")
    # Amendment.all.each do |amendment, content|
    #   binding.pry
    #   if content.match(/#{search}/)
    #     binding.pry
    #       content
    #   end

    # end
    self.find_by_sql("SELECT * FROM amendments
      WHERE amendments LIKE #{search}
    ")
    binding.pry

  end

  # -- create objects for every amendment key value pair to seed the databse with
  def self.seed_databse(params)
    params.each do |name,content|
     	self.create(name: name, content: content)
      self
    end
  end

end
