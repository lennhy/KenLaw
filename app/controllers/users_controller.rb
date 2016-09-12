class UsersController < ApplicationController

  # -- takes you to the signup page from the home page for new users
  get "/signup" do
    if !session[:user_id] # -- if user is not logged in
     erb :"users/create_user"
   else
     redirect to "/questions" # -- if user is already logged in then they should not see the signup page
   end
  end

  # -- after attempt to signup
  post "/signup" do
    if params[:email] =="" || params[:username] =="" || params[:password] ==""
      redirect to "/signup"
      flash[:message] = "Sorry this form is incomplete."
    else
      @user = User.create(email: params[:email], username: params[:username], password: params[:password])
      session[:user_id] = @user.id
      flash[:message] = "You have successfully signed up."
      redirect to "/questions"
    end
  end

  # -- get to the login page view
  get "/login" do
    if session[:user_id].nil?
      erb :"users/login"
    else
      redirect "/questions"
    end
  end

  # -- after attempt to login
  post "/login" do
    user = User.find_by(username: params[:username])
    if user && user.authenticate(params[:password]) # --check if username and password matches
      session[:user_id] = user.id
      redirect to "/questions"
    else
      redirect to "/login"
    end
  end

  # -- show users page with all their posted questions
  get "/show" do
    erb :"users/show"
  end

  get "/logout" do
    if !session[:user_id].nil?
      session.destroy
      redirect to "/login"
    else
      redirect to "/"
    end
  end

end
