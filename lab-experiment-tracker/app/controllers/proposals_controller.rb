class ProposalsController < ApplicationController

  def index

    #@proposal = Proposal.create(summary: "sdlkhflkadsj", hypothesis: "sdfadsf", user: User.first)
    #@comment = @proposal.comments.new
    @user = User.new
  	@proposals = Proposal.all
    @proposal = Proposal.new

  end

  def new
    @proposal = Proposal.new
  end

  def show
    @proposal = Proposal.find(params[:id])
    @comment = @proposal.comments
    @experiments = @proposal.experiments
    @status = @proposal.get_status
  end

  def create
    @proposal = Proposal.new(proposal_params)

    @proposal.user_id = session[:user_id]

    if @proposal.save
      redirect_to @proposal, notice: 'Proposal was successfully created.'
    else
      render :show, status: 422
    end
  end

  def update
    @proposal = Proposal.find(params[:id])
    @status = @proposal.get_status

    if @status == "Open"
      @proposal.update_attributes(status: 2)
    elsif @status == "In progress"
      @proposal.update_attributes(status: 3)
    elsif @status == "Closed"
      @proposal.update_attributes(status: 4)
    end
    @proposal.save
    redirect_to(:back)
  end

private
  def proposal_params
    params.require(:proposal).permit(:summary, :hypothesis)
  end

end
