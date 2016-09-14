class AmendmentsController < ApplicationController
  # Amendments route controller
    get '/amendments' do
      @amendments = Amendments.all
      erb :'amendments/amendments'
    end

    # -- show individual amendment 
    get'/amendments/:id' do
      @amendment = Amendment.find_by_id(params[:id])
      erb :'amendments/show_amendment'
    end


end
