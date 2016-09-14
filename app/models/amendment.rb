class Amendment < ActiveRecord::Base
  has_many :users, through: :questions
  belongs_to :question

  def self.find_by_description(search)
  	box=[]
    search_array = search.split # --turn string into an array to compare each word in the sentence to the content in the amendment table
    Amendment.all.each do |a|
    	search_array.each do | word |
    	  if a.content.match(/#{word}/) # --compare each word with the content
    	  	 a  # --put the matching values in an array
    	  end
      end
    end
  end

  # -- create objects for every amendment key value pair to seed the databse with
  def self.seed_databse(params)
    params.each do |name,content|
     	self.create(name: name, content: content)
      self
    end
  end

end
