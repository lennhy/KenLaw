class Question < ActiveRecord::Base
  has_many :results
  belongs_to :user

  # extend Slugifiable::ClassMethods
  # include Slugifiable::InstanceMethods
  @@amendments = [
    
  ]
  def self.find_by_description(search)
    bill = search.split(" ").join(", ")
    @foo.any? do |a, s|
      if s.match(/#{search}/)
        puts s
      end
    end
  end

end
