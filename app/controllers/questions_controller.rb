class QuestionsController < ApplicationController

# --------------------------- READ --------------------------------

  # -- see all the posted questions from every user
  get "/users_questions" do
    if logged_in?
      @questions = Question.all
      erb :"questions/users_questions"
    else
      redirect "/login"
    end
  end

  # # --see your own questions
  # get "/user_questions" do
  #   if logged_in?
  #     current_user
  #     current_user.questions
  #     erb :"questions/user_questions"
  #   else
  #     redirect "/login"
  #   end
  # end



  # --------------------------- CREATE --------------------------------

  # -- get the create a question page
  get '/create_question' do
    if logged_in?
       erb :"questions/create_question"
     else
       redirect to '/login'
     end
  end

  # -- create and see the questions of the individual user
  post '/users_questions' do

    if params[:content] == "" # --check if the user entered correct information if not redirect
      redirect to "/create_question"
    else
      @question = current_user.questions.create(content: params[:content])
      # @search = params[:content]
      # # find the closest matching amendment for the search entered in the create a question page
      # @amendment = Amendment.find_by_sql("SELECT * FROM Amendments WHERE Name OR Content LIKE '%#{@search}%'")

      if @question.nil? || @q == ""
        redirect to "/create_question"
      else
      # -- associate the amendment that was returned to belong to the question
        @question.save
        redirect to "/users_questions/#{@question.id}"
      end

    end
  end

  # -- see the newly created question and its corresponding amendment result from the search
  get '/users_questions/:id' do
    if logged_in?
      @question = current_question
      erb :'questions/show_question'
    else
      redirect to '/login'
    end
  end

  # --------------------------- UPDATE --------------------------------

  # -- change question
  get '/users_questions/:id/edit' do
    if logged_in?
      @question = current_question
      if @question.user_id == current_user.id
       erb :'questions/edit_question'
      else
        redirect to '/users_questions'
      end
    else
      redirect to '/login'
    end
  end

  # --edit question and return a new amendment result
  patch '/users_questions/:id' do
    if params[:content] == "" # --check if the user entered correct information if not redirect
      redirect to "/users_questions/create_question"
    else
      current_question.update(content: params[:content])      # -- find the closest matching amendment for the search entered in the create a question page
      # -- associate the amendment that was returned to belong to the question
      redirect to "/users_questions/#{current_question.id}"
      end
  end

  # --------------------------- DELETE --------------------------------

  # --delete question and corresponding amendment result
  delete '/users_questions/:id/delete' do
    if logged_in?
      if current_question != "" || current_question != nil
        current_question.id = params[:id]
      if current_question.user_id == session[:user_id]
        current_question.delete
        flash[:notice] = 'Your question was successfully deleted'
        erb :'users/profile'
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
