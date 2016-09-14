class AmendmentsController < ApplicationController
  # Amendments route controller
    get '/amendments/amendments' do
      @amendments = Amendment.all
      erb :'amendments/amendments'
    end

    # -- show individual amendment
    get'/amendments/:id' do
      @amendment = Amendment.find_by_id(params[:id])
      erb :'amendments/show_amendment'
    end


end
