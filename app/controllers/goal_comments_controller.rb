class GoalCommentsController < ApplicationController
  def create
    @goal = Goal.find(params[:goal_id])
    @comment = @goal.comments.new(comment_params)
    @comment.author_id = current_user.id
    flash[:error] = @comment.errors.full_messages unless @comment.save
    redirect_to goal_url(@goal)
  end

  private

    def comment_params
      params.require(:goal_comment).permit(:body)
    end
end
