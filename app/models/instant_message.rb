class InstantMessage
  # Does not inherit from active record because the messages are not saved to the database.
  def initialize(session)
          @session ||= session
      end

      # ======================= MESSAGES ========================
      def message=(message)
          @session[:instant] = message
      end

      def message
          message = @session[:instant] #tmp get the value
          message # display the value
      end

      # ======================= ERRORS ========================
      def error=(error)
          @session[:instant] = error
      end

      def error
          error = @session[:instant] #tmp get the value
          error # display the value
      end
end
