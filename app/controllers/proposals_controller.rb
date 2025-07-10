class ProposalsController < ApplicationController
  before_action :set_proposal, only: %i[show edit update destroy]

  def index
    @proposals = Proposal.all
  end

  def show; end

  def new
    @proposal = current_user.proposals.build
  end

  def edit; end

  def create
    @proposal = current_user.proposals.build(proposal_params)
    if @proposal.save
      redirect_to @proposal, notice: "Proposal created."
    else
      render :new
    end
  end

  def update
    if @proposal.update(proposal_params)
      redirect_to @proposal, notice: "Proposal updated."
    else
      render :edit
    end
  end

  def destroy
    @proposal.destroy
    redirect_to proposals_path, notice: "Proposal deleted."
  end

  private

  def set_proposal
    @proposal = Proposal.find(params[:id])
  end

  def proposal_params
    params.require(:proposal).permit(:title, :description)
  end
end
