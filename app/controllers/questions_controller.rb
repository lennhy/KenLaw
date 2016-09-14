class QuestionsController < ApplicationController

  # -- see all the posted questions from every user
  get "/users_questions" do
    if session[:user_id]
      @questions = Question.all
      erb :"questions/users_questions"
    else
      redirect "/login"
    end
  end

  # --see your own questions
  get "/user_questions" do
    if session[:user_id]
      @user = User.find(session[:user_id])
      erb :"questions/user_questions"
    else
      redirect "/login"
    end
  end

  # -- find user of a posted question
  # -- get the create a question page
  get '/users_questions/create_question' do
    if session[:user_id]
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
      user = User.find_by_id(session[:user_id])
      @question = Question.create(:content => params[:content], :user_id => user.id)
      @search = params[:content]
      # -- find the closest matching amendment for the search entered in the create a question page
      @amendment = Amendment.find_by_sql("SELECT * FROM Amendments WHERE Name OR Content LIKE '%#{@search}%'")
      # -- associate the amendment that was returned to belong to the question
      @question.amendments << @amendment
      @question.save
      redirect to "/users_questions/#{@question.id}"
    end
  end

  # -- see the newly created question and its corresponding amendment result from the search
  get '/users_questions/:id' do
    if session[:user_id]
      @question = Question.find_by_id(params[:id])
      erb :'questions/show_question'
    else
      redirect to '/login'
    end
  end

  # -- change question
  get '/users_questions/:id/edit' do
    if session[:user_id]
      @question = Question.find_by_id(params[:id])
      if @question.user_id == session[:user_id]
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
      @question = Question.find_by_id(params[:id])
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
    @question = Question.find_by_id(params[:id])
    if session[:user_id]
      @question = Question.find_by_id(params[:id])
      if @question.user_id == session[:user_id]
        @question.delete
        @question.amendments.delete
        redirect to '/users_questions'
      else
        redirect to '/users_questions'
      end
    else
      redirect to '/login'
    end
  end


end
