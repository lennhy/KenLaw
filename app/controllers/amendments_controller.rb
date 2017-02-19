class AmendmentsController < ApplicationController

  # -- get the create a question page
  get '/amendments' do
    @amendments = Amendment.all
    if logged_in?
       erb :"amendments/amendments"
     else
       redirect to '/login'
     end
  end

  # -- see the newly created question and its corresponding amendment result from the search
  get '/amendments/:id' do
    if logged_in?
      @amendment = current_amendment
      erb :'amendments/show_amendment'
    else
      redirect to '/login'
    end
  end

  # --delete question and corresponding amendment result
  delete '/users_amendments/:id/delete' do
    if logged_in?
      if current_amendment != "" || current_amendment != nil
        current_amendment.id = params[:id]
      if current_amendment.user_id == session[:user_id]
        current_amendment.delete
        flash[:notice] = 'Your question was successfully deleted'
        erb :'/'
      else
        flash[:error] 
        redirect to '/profile'
      end
    end
    else
      redirect to '/login'
    end
  end

end
