class QuestionsController < ApplicationController

# --------------------------- READ & CREATE--------------------------------

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
    question = Question.new(content: params[:content], user_id: current_user.id)
    if question.save
      instant.message = "Your question was submitted."
      redirect to "/"
    else
      instant.error =  question.errors.full_messages.join(", ")
      redirect to "questions/new"
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
    question = Question.find(params[:id])
    if question.update(content: params[:content]) # --check if the user entered correct information if not redirect
      instant.message = "Your question has been edited"
      redirect to "users/profile"
    else
      instant.error =  question.errors.full_messages.join(", ")
      # --check if the user entered correct information if not redirect
      redirect to "/questions/#{question.id}/edit"
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
