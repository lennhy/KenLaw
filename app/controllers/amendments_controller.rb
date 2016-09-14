class AmendmentsController < ApplicationController
  # Amendments route controller
    get '/amendments' do
      @amendments = Amendments.all
      erb :'amendments/show_amendments'
    end

    # get '/genres/show' do
    #   erb :'genres/show'
    # end
    #
    get'/amendments/:id' do
      @user = User.find_by_slug(params[:id])
      @question = Question.find_by_id(params[:id])
      @amendment = Amendment.find_by_id(params[:id])

      erb :'amendments/show_amendment'
    end


end
