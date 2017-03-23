class UsersController < ApplicationController

  # -- takes you to the signup page from the home page for new users
  get "/signup" do
    # -- if user is not logged in
    if !logged_in?
     erb :"users/create_user"
   else
     # -- if user is already logged in then they should not see the signup page
     redirect to "/"
   end
  end

  # -- after attempt to signup
  post "/signup" do
    user = User.new(email: params[:email], username: params[:username], password: params[:password])
    if user.save
      instant.message = "You have successfully signed up."
      session[:user_id] = user.id
      redirect to "/"
    else
      instant.error =  user.errors.full_messages.join(", ")
      redirect to "/signup"
    end
  end

  # -- get to the login page view
  get "/login" do
    if !logged_in?
      erb :"users/login"
    else
      redirect "/"
    end
  end

  # -- after attempt to login
  post "/login" do
    user = User.find_by(username: params[:username])
    # --check if username and password matches
    if user && user.authenticate(params[:password])
      session[:user_id] = user.id
      instant.message = "You have successfully logged in."
      redirect to "/"
    else
      if user == nil
        instant.error =  "No such user exists. Please try logging in again."
      elsif !user.authenticate(params[:password])
        instant.error =  "Your password is incorrect. Please enter the correct password."
      end
      redirect to "/login"
    end
  end


  # -- show users page of question posted by id
  get "/users/:id" do
    if logged_in?
      @user = User.find(params[:id])
      erb :'users/show'

    else
      redirect to '/login'
    end
  end

  # --show current_user profile
  get "/users/profile" do
    if logged_in?
      erb :"users/profile"
    else
      redirect "/login"
    end
  end


  get "/logout" do
    if logged_in?
      session.destroy
      instant.message = "You have successfully logged out of your account."
      redirect to "/login"
    else
      redirect to "/"
    end
  end

  # Add an amendment to user
  patch "/users/amendment/:id" do
    if logged_in?
      current_user.amendments << current_amendment
      flash[:notice] = "Amendment successfully added"
      redirect to 'users/profile'
    end
  end

  # --delete current user's amendment
  delete '/users/amendment/:id/delete' do
    if logged_in?
      if current_amendment.user_id == session[:user_id]

        current_user.amendments.delete(Amendment.find(params[:id]))

        flash[:notice] = 'Your amendment was successfully deleted'
        redirect to 'users/profile'
      else
        flash[:error]
        erb '/'
      end

      else
        redirect to '/login'
      end
  end

end
