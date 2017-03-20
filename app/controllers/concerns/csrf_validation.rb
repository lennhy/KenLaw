module CSRFValidation
  module InstanceMethods

    def no_characters
      # if any of the following special characters are entered
      if content =~ /[\|\(\)\[\]\{\}\+\\\^\$\*]/i
        errors.add(:content, "can't have special characters")
      end
    end

  end
end
