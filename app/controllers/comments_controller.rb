class CommentsController < ApplicationController

# -- see all the posted comments from every user
get "/comments" do
end

# -- see all the posted comments from every user
get "/comments/:id" do
if logged_in?
  erb :'comments/show'
else
  redirect to '/login'
end
end

# -- change question
get '/comments/:id/edit' do
if logged_in?
  if current_comment.user_id == current_user.id
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
# user = User.new(email: params[:email], username: params[:username], password: params[:password])
# if user.save
#   instant.message = "You have successfully signed up."
#   session[:user_id] = user.id
#   redirect to "/"
# else
#   instant.error =  user.errors.full_messages.join(", ")
#   redirect to "/signup"
# end
post '/comments' do
  question = Question.find(params[:id])
  comment = Comment.new(content: params[:content], question_id: question.id, user_id: current_user.id)
  if comment.save
    question.comments << comment
    instant.message = "Your comment was submitted."
    redirect to "/"
  else
    instant.error =  comment.errors.full_messages.join(", ")
    redirect to "/"
  end

end

#-------------- UPDATE --------------------------------

# --edit comment and return a new amendment result
patch '/comments/:id' do
  comment = Comment.find(params[:id])
  if comment.update(content: params[:content]) # --check if the user entered correct information if not redirect
    instant.message = "Your comment has been edited"
    redirect to "users/profile"
  else
    instant.error =  comment.errors.full_messages.join(", ")
    # -- associate the amendment that was returned to belong to the comment
    redirect to "/comments/#{comment.id}/edit"
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
