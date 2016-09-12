class QuestionsController < ApplicationController

  get "/users_questions" do
    if session[:user_id]
      @questions = Question.all
      erb :"questions/users_questions"
    else
      redirect "/login"
    end
  end

  post '/user_question' do
    @result = Result.find
    # @song = Song.create(name: params["Name"])
    # @song.artist = Artist.find_or_create_by(name: params["Artist Name"])
    # @question.result_ids = params[:results]
    # @song.save

    flash[:message] = "Successfully posted a question."

    redirect to "/users_questions/#{@result.id}"
  end

end
