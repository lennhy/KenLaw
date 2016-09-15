class QuestionsController < ApplicationController

  # -- see all the posted questions from every user
  get "/users_questions" do
    if logged_in?
      @questions = Question.all
      erb :"questions/users_questions"
    else
      redirect "/login"
    end
  end

  # --see your own questions
  get "/user_questions" do
    if logged_in?
      @user = current_user
      erb :"questions/user_questions"
    else
      redirect "/login"
    end
  end

  # -- get the create a question page
  get '/users_questions/create_question' do
    if logged_in?
       erb :"questions/create_question"
     else
       redirect to '/login'
     end
  end

  # -- see the questions of the individual user
  post '/users_questions' do
    if params[:content] == "" # --check if the user entered correct information if not redirect
      redirect to "/users_questions/create_question"
    else
      @question = current_user.questions.create(content: params[:content])
      @search = params[:content]
      # -- find the closest matching amendment for the search entered in the create a question page
      @amendment = Amendment.find_by_sql("SELECT * FROM Amendments WHERE Name OR Content LIKE '%#{@search}%'")

      if @amendment.empty?
        redirect to "/users_questions/create_question"
      else
      # -- associate the amendment that was returned to belong to the question
        @question.amendments << @amendment
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
    if params[:content] == ""
      redirect to "/questions/#{params[:id]}/edit"
    else
      @question = current_question
      @question.amendments.clear
      @question.content = params[:content]
      @search = params[:content]
      @amendment = Amendment.find_by_sql("SELECT * FROM Amendments WHERE Name OR Content LIKE '%#{@search}%'")
      @question.amendments << @amendment
      @question.save
      redirect to "/users_questions/#{@question.id}"
    end
  end

  # --delete question and corresponding amendment result
  delete '/users_questions/:id/delete' do
    if logged_in?
      @question = current_question
      if @question.user_id == session[:user_id]
        @question.delete
        @question.amendments.delete
        redirect to '/user_questions'
      else
        redirect to '/users_questions'
      end
    else
      redirect to '/login'
    end
  end


end
