class UsersController < ApplicationController

  # -- takes you to the second page for new users signup
  get "/signup" do
    if !session[:user_id] # -- if user is not logged in
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
