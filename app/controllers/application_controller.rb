require 'sinatra/base'
require './config/environment'
require 'rack-flash'

class ApplicationController < Sinatra::Base

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
    enable :sessions
		set :session_secret, "kener_secret" # --encryption key that will be used to create a
  end

  # --home page for website
  get "/" do
    erb :index
  end

end
