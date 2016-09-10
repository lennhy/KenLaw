class UsersController < ApplicationController

# -- takes you to the second page for new users signup
  get '/signup' do
     erb :"users/create_user"
   end

end
