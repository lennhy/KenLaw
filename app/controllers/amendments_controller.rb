class AmendmentsController < ApplicationController

  # -- get the create a question page
  get '/amendments' do
    if logged_in?
      @amendments = Amendment.all
       erb :"amendments/amendments"
     else
       redirect to '/login'
     end
  end

  # -- see the newly created question and its corresponding amendment result from the search
  get '/amendments/:id' do
    if logged_in?
      erb :'amendments/show'
    else
      redirect to '/login'
    end
  end


end
