class UsersController < ApplicationController

  # -- takes you to the signup page from the home page for new users
  get "/signup" do
    if !logged_in? # -- if user is not logged in
     erb :"users/create_user"
   else
     redirect to "/users_questions" # -- if user is already logged in then they should not see the signup page
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
      redirect to "/users_questions"
    end
  end

  # -- get to the login page view
  get "/login" do
    if !logged_in?
      erb :"users/login"
    else
      flash[:message] = "You have successfully logged in."
      redirect "/users_questions"
    end
  end

  # -- after attempt to login
  post "/login" do
    user = User.find_by(username: params[:username])
    if user && user.authenticate(params[:password]) # --check if username and password matches
      session[:user_id] = user.id
      redirect to "/users_questions"
    else
      redirect to "/login"
    end
  end

  # -- show users page of question posted by id
  get "/users/:id" do
    if logged_in?
      @user = User.find_by_id(params[:id])
      @amendments = @user.amendments
      erb :'users/show'
    else
      redirect to '/login'
    end
  end

  get "/logout" do
    if logged_in?
      session.destroy
      redirect to "/login"
    else
      redirect to "/"
    end
  end

end
