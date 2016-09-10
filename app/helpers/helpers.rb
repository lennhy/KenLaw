require 'sinatra/base'
class Helpers
    # --To add double protection to this view
    def self.current_user(session)
      User.find(session[:user_id])
    end

    def self.is_logged_in?(session)
      !!session[:user_id]
    end

  end

end
# --there is information on most pages that are dependent on being logged in. You can see a lot of information if you are logged in, and practically none if you're not. This sort of application flow is handled without logic by the use of helper methods.

# --Instead of writing that type of logic directly in your view, we use helper methods. Helper methods are methods that are written in your controller, that are accessible in your views, and provide some support.
