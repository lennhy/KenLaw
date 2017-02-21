class UsersController < ApplicationController

  # -- takes you to the signup page from the home page for new users
  get "/signup" do
    if !logged_in? # -- if user is not logged in
     erb :"users/create_user"
   else
     redirect to "/" # -- if user is already logged in then they should not see the signup page
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
      redirect to "/"
    end
  end

  # -- get to the login page view
  get "/login" do
    if !logged_in?
      erb :"users/login"
    else
      flash[:message] = "You have successfully logged in."
      redirect "/"
    end
  end

  # -- after attempt to login
  post "/login" do
    user = User.find_by(username: params[:username])
    if user && user.authenticate(params[:password]) # --check if username and password matches
      session[:user_id] = user.id
      redirect to "/"
    else
      redirect to "/login"
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

  # -- show users page of question posted by id
  get "/users/:id" do
    if logged_in?
      @user = User.find_by_id(params[:id])
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

  # Add an amendment to user
  patch "/users/amendment/:id" do
    if logged_in?
      current_user.amendments << current_amendment
      flash[:notice] = "Amendment successfully added"
      redirect to 'users/profile'
    end
  end

  # --delete amendment result
  delete '/users/amendment/:id/delete' do
    if logged_in?
      # if current_amendment != "" || current_amendment != nil
      #   current_amendment.id = params[:id]

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
