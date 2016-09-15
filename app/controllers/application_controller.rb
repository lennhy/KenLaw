require 'sinatra/base'
require './config/environment'
require 'rack-flash'

class ApplicationController < Sinatra::Base

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
    enable :sessions
    use Rack::Flash
		set :session_secret, "kener_secret" # --encryption key that will be used to create a
  end

  # --home page for website
  get "/" do
    erb :index
  end

  # -- helper method
   helpers do
      # --To add double protection to the view so that only the current user, when they are logged in, can see their information
      def current_user
        User.find(session[:user_id])
      end

      def logged_in?
        !!session[:user_id]
      end

  end

  #--You can see a lot of information if you are logged in, and practically none if you're not.
  # --Instead of writing that type of logic directly in your view, we use helper methods. Helper methods are methods that are written in your controller, that are accessible in your views, and provide some support.


end
