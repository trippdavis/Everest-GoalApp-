class UserCommentsController < ApplicationController
  def create
    @user = User.find(params[:user_id])
    @comment = @user.comments.new(comment_params)
    @comment.author_id = current_user.id
    flash[:error] = @comment.errors.full_messages unless @comment.save
    redirect_to user_url(@user)
  end

  private

    def comment_params
      params.require(:user_comment).permit(:body)
    end
end
