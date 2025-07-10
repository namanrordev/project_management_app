class ProposalCostsController < ApplicationController
  before_action :set_proposal
  before_action :authenticate_user!

  def new
    @proposal_cost = @proposal.proposal_costs.build
  end

  def create
    @proposal_cost = @proposal.proposal_costs.build(proposal_cost_params)
    if @proposal_cost.save
      redirect_to proposal_path(@proposal), notice: "Cost item added."
    else
      render :new, status: :unprocessable_entity
    end
  end

  def destroy
    @proposal_cost = @proposal.proposal_costs.find(params[:id])
    @proposal_cost.destroy
    redirect_to proposal_path(@proposal), notice: "Cost item removed."
  end

  private

  def set_proposal
    @proposal = Proposal.find(params[:proposal_id])
  end

  def proposal_cost_params
    params.require(:proposal_cost).permit(:category, :description, :amount)
  end
end
