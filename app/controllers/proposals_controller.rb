class ProposalsController < ApplicationController
  before_action :set_proposal, only: %i[show edit update destroy]

  def index
    @proposals = Proposal.all
  end

  def show; end

  def new
    @proposal = current_user.proposals.build
  end

  def edit
    authorize_proposal_editing
  end

  def create
    @proposal = current_user.proposals.build(proposal_params)
    if @proposal.save
      redirect_to @proposal, notice: "Proposal created."
    else
      render :new
    end
  end

  def update
    authorize_proposal_editing
    if @proposal.update(proposal_params)
      redirect_to @proposal, notice: "Proposal updated."
    else
      render :edit
    end
  end

  def destroy
    if current_user == @proposal.user || @proposal.co_authors.accepted.exists?(user_id: current_user.id)
      @proposal.destroy
      redirect_to proposals_path, notice: "Proposal deleted."
    else
      redirect_to proposals_path, alert: "You are not authorized to delete #{@proposal.title} with author #{@proposal.user} proposal."
    end
  end

  private

  def set_proposal
    @proposal = Proposal.find(params[:id])
  end

  def proposal_params
    params.require(:proposal).permit(:title, :description)
  end

  def authorize_proposal_editing
    unless current_user == @proposal.user || @proposal.co_authors.accepted.exists?(user_id: current_user.id)
      redirect_to proposals_path, alert: "You are not authorized to edit \'#{@proposal.title}\'' with author #{@proposal.user.name} proposal."
    end
  end
end
