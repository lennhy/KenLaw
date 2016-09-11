class UsersController < ApplicationController

# -- takes you to the second page for new users signup
  get "/signup" do
     erb :"users/create_user"
  end

  get "/login" do
      erb :"users/login"
  end

# -- after attempt to login
  post "/login" do
    redirect to "/users_questions"
  end

  # -- show users page with all their posted questions
  get "/show"
    erb :"/show"
  end
end
