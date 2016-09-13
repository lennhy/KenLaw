class QuestionsController < ApplicationController

  # --see all user's questions
  get "/users_questions" do
    if session[:user_id]
      @questions = Question.all
      erb :"questions/users_questions"
    else
      redirect "/login"
    end
  end

  get '/questions/create_question' do
    if session[:user_id]
       erb :"questions/create_question"
     else
       redirect to '/login'
     end
  end

  # -- see the questions of the individual user
  post '/users_questions' do
    if params[:content] == "" # --check if the user entered correct information if not redirect
      redirect to "/questions/create_question"
    # else
    #   @user = User.find(session[:user_id])
    #   @question = Question.create(content: params[:content])
    #   @amendment = Amendment.where(content: params[:content])
    #   binding.pry
    #   redirect to "/users_questions/#{@question.id}"
    # end
    else
      user = User.find_by_id(session[:user_id])
      @question = Question.create(:content => params[:content], :user_id => user.id)
      @search = params[:content]
      @amendment = Amendment.find_by_sql("SELECT * FROM Amendments WHERE Content LIKE %#{@search}% ")
      redirect to "/questions/#{@question.id}"
    end
end
# SELECT * FROM Customers
# WHERE City LIKE '%es%';

get '/questions/:id' do
  if session[:user_id]
    @question = Question.find_by_id(params[:id])
    erb :'questions/show_question'
  else
    redirect to '/login'
  end
end



end
