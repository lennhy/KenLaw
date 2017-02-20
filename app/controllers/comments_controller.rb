class CommentsController < ApplicationController

  # -- see all the posted comments from every user
  get "/users_comments" do
  end

  # -- see all the posted comments from every user
  get "/users_comments/:id" do
    if logged_in?
      @comment = current_comment
      erb :'comments/show_comment'
    else
      redirect to '/login'
    end
  end

  # -- change question
  get '/users_comments/:id/edit' do
    if logged_in?
      @comment = current_comment
      if @comment.user_id == current_user.id
       erb :'comments/edit_comment'
      else
        redirect to '/users_questions'
      end
    else
      redirect to '/login'
    end
  end

    # --------------------------- CREATE --------------------------------

    # -- create and see the comments of the individual user
    post '/users_comments' do
      if params[:content] &&  params[:id] == "" || params[:content] &&  params[:id] == nil # --check if the user entered correct information if not redirect
        redirect to "/users_questions"
      else
        question = Question.find_by(params[:id])
        comment = current_user.comments.create(content: params[:content])
        question.comments << comment
        redirect to "/users_questions"
      end

    end

  #-------------- UPDATE --------------------------------

    # --edit comment and return a new amendment result
    patch '/users_comments/:id' do
      if params[:content] == "" # --check if the user entered correct information if not redirect
        redirect to "/profile"
      else
        @comment = current_comment
        current_comment.update(content: params[:content])      # -- find the closest matching amendment for the search entered in the create a comment page
        # -- associate the amendment that was returned to belong to the comment
        redirect to "/profile"
        end
    end

    # --------------------------- DELETE --------------------------------

    # --delete comment and corresponding amendment result
    delete '/users_comments/:id/delete' do
      if logged_in?

        if current_comment != "" || current_comment != nil
          binding.pry
          # current_comment.id = params[:id]
        if current_comment.user_id == session[:user_id]
          current_comment.delete
          flash[:notice] = 'Your comment was successfully deleted'
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
