class QuestionsController < ApplicationController

  get "/questions" do
    if session[:user_id]
      @questions = Question.all
      erb :"questions/questions"
    else
      redirect "/login"
    end
  end

  get '/questions/create_question' do
    if session[:user_id]
       erb :"questions/create_question"
     end
  end

  post '/quesitons' do
    @result = Result.find_by_description(params[:question])
    binding.pry
    # @song = Song.create(name: params["Name"])
    # @song.artist = Artist.find_or_create_by(name: params["Artist Name"])
    # @question.result_ids = params[:results]
    # @song.save

    flash[:message] = "Successfully posted a question."

    redirect to "/questions/#{@result.id}"
  end

end
