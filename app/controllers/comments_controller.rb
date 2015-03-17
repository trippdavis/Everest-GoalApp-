class CommentsController < ApplicationController
  def create
    @comment = find_commentable.comments.new(comment_params)
    flash[:error] = @comment.errors.full_messages unless @comment.save
    redirect_to @comment.commentable
  end

  def find_commentable
    params.each do |name, value|
      if name =~ /(.+)_id$/
        return $1.classify.constantize.find(value)
      end
    end
    nil
  end

  private

    def comment_params
      params(:comment).require(:body)
    end
end
