class CommentController < ApplicationController
  def new
    @comment = Comment.new(comment_params)
    if @comment.save
      #redirect_to controller: 'article', action: 'show', id: params[:article_id]
      redirect_to article_show_path(:id => params[:comment][:article_id]), success_notice: 'Your Comment is Added!'
    else
      #TODO not printing the validation error
      redirect_to article_show_path(:id => params[:comment][:article_id]), failure_notice: 'Add some content'
      #byebug
    end
  end

  def delete
    @comment = Comment.find(params[:id])
    article_id = @comment.article_id
    @comment.destroy
    redirect_to article_show_path(:id => article_id), success_notice: 'Comment is successfully deleted'
  end
  private
  def comment_params
    params.require(:comment).permit(:content,:article_id,:user_id)
  end
end
