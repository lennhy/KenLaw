class QuestionsController < ApplicationController

  get "/users_questions" do
    if session[:user_id]
      @questions = Question.all
      erb :"questions/users_questions"
    else
      redirect "/login"
    end
  end

end
