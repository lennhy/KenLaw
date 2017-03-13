class QuestionsController < ApplicationController

# --------------------------- READ --------------------------------


  # --------------------------- CREATE --------------------------------

  # -- get the create a question page
  get '/questions/new' do
    if logged_in?
       erb :"questions/new"
     else
       redirect to '/login'
     end
  end

  # -- create and see the questions of the individual user
  post '/' do
    if params[:content] == "" || params[:content] == nil # --check if the user entered correct information if not redirect
      redirect to "questions/new"
    else
      current_user.questions.create(content: params[:content])
      redirect to "users/profile"
    end
  end

  # -- see the newly created question and its corresponding amendment result from the search
  get '/questions/:id' do
    if logged_in?
      current_question
      erb :'questions/show'
    else
      redirect to '/login'
    end
  end

  # --------------------------- UPDATE --------------------------------

  # -- change question
  get '/questions/:id/edit' do
    if logged_in?
      if current_question.user_id == current_user.id
       erb :'questions/edit'
      else
        redirect to '/'
      end
    else
      redirect to '/login'
    end
  end

  # --edit question and return a new amendment result
  patch '/questions/:id' do
    # --check if the user entered correct information if not redirect
    if params[:content] == ""
      redirect to "/questions/:id/edit"
    else
      current_question.update(content: params[:content])
      # -- associate the amendment that was returned to belong to the question
      redirect to "users/profile"
      end
  end

  # --------------------------- DELETE --------------------------------

  # --delete question and corresponding amendment result
  delete '/questions/:id/delete' do
    if logged_in?
      if current_question != "" || current_question != nil
        current_question.id = params[:id]
      if current_question.user_id == session[:user_id]
        current_question.delete
        flash[:notice] = 'Your question was successfully deleted'
        erb :'users/profile'
      else
        flash[:error]
        redirect to 'users/profile'
      end
    end
    else
      redirect to '/login'
    end
  end


end
