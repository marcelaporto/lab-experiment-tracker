class ObservationsController < ApplicationController

  include CommentsHelper
  include ApplicationHelper

  def index
  end

  def new
  end

  def create
    
    @object = request.fullpath.split("/")[1][0..-2].capitalize.constantize.find(request.fullpath.split("/")[2]).observations.create(body: params[:observation][:body], scientist_id: current_user.id)

    redirect_to(:back)
  end

end
