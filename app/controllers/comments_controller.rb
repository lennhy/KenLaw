class CommentsController < ApplicationController

# -- see all the posted comments from every user
get "/comments" do
end

# -- see all the posted comments from every user
get "/comments/:id" do
if logged_in?
  @comment = current_comment
  erb :'comments/show'
else
  redirect to '/login'
end
end

# -- change question
get '/comments/:id/edit' do
if logged_in?
  @comment = current_comment
  if @comment.user_id == current_user.id
   erb :'comments/edit'
  else
    redirect to '/'
  end
else
  redirect to '/login'
end
end

# --------------------------- CREATE --------------------------------

# -- create and see the comments of the individual user
post '/comments' do
  if params[:content] &&  params[:id] == "" || params[:content] &&  params[:id] == nil # --check if the user entered correct information if not redirect
    redirect to "/"
  else
    question = Question.find(params[:id])
    comment = Comment.create(content: params[:content], question_id: question.id, user_id: current_user.id)
    question.comments << comment
    redirect to "users/profile"
  end

end

#-------------- UPDATE --------------------------------

# --edit comment and return a new amendment result
patch '/comments/:id' do
  if params[:content] == "" # --check if the user entered correct information if not redirect
    redirect to "users/profile"
  else
    @comment = current_comment
    current_comment.update(content: params[:content])      # -- find the closest matching amendment for the search entered in the create a comment page
    # -- associate the amendment that was returned to belong to the comment
    redirect to "users/profile"
    end
end

# --------------------------- DELETE --------------------------------

# --delete comment and corresponding amendment result
delete '/comments/:id/delete' do
  if logged_in?

    if current_comment != "" || current_comment != nil
      # current_comment.id = params[:id]
    if current_comment.user_id == session[:user_id]
      current_comment.delete
      flash[:notice] = 'Your comment was successfully deleted'
      redirect to 'users/profile'
    else
      flash[:error]
      redirect to 'users/profile'
    end
  end
  else
    redirect to '/login'
  end
end

end
