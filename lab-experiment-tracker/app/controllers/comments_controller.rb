class CommentsController < ApplicationController

  include CommentsHelper
  include ApplicationHelper

  def index
  end

  def new
  end

  def create

    @object = request.fullpath.split("/")[1][0..-2].capitalize.constantize.find(request.fullpath.split("/")[2]).comments.create(body: params[:comment][:body], user_id: current_user.id)

    redirect_to(:back)
  end

end
