class ExperimentsController < ApplicationController
  def new
    render 'experiments/_new.html.erb'
  end
  def create
    @proposal = Proposal.find(proposal_params)
    @experiment = Experiment.new(experiment_params)
    @experiment.scientist_id = current_user.id
    @experiment.proposal_id = @proposal.id

    @experiment.save
    @proposal.put_in_progress
    
    redirect_to proposal_path(@proposal)
  end

  def show
    @experiments = Experiment.all
    @experiment = Experiment.find(params[:id])

  end

  def update
    @experiment = Experiment.find(params[:id])
    @experiment.update(experiment_params)

    redirect_to (:back)
  end

  private
  def experiment_params
    params.require(:experiment).permit(:title, :results, :conclusions)
  end

  def proposal_params
    params.require(:proposal_id).to_i
  end
end
