module CommentsHelper

  def comments_params
    params.require(:comment).permit(:body)
  end

end
