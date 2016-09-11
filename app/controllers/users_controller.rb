class UsersController < ApplicationController

  # -- takes you to the second page for new users signup
  get "/signup" do
     erb :"users/create_user"
  end

  # -- after attempt to signup
  post "/signup" do
    redirect to "/users_questions"
  end

  # -- login page
  get "/login" do
      erb :"users/login"
  end

  # -- after attempt to login
  post "/login" do
    redirect to "/users_questions"
  end

  # -- show users page with all their posted questions
  get "/show" do
    erb :"users/show"
  end

  get "/logout" do
    session.destroy
    redirect to "/login"
  end

end
