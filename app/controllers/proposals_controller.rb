class ProposalsController < ApplicationController
  before_action :set_proposal, only: %i[show edit update destroy approve]

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

  def approve
    unless @proposal.user == current_user || @proposal.co_authors.accepted.exists?(user: current_user)
      redirect_to @proposal, alert: "You are not authorized to approve this proposal."
      return
    end

    @proposal.approvals.create(user: current_user)

    if @proposal.approved_by_all_required?
      notice = "Proposal approved by all collaborators!"
    else
      notice = "Your approval has been recorded."
    end

    redirect_to @proposal, notice: notice
  end


  private

  def set_proposal
    @proposal = Proposal.find(params[:id])
  end

  def proposal_params
    permitted = [:title, :description] # or whatever your base fields are
    permitted += [:feasibility_score, :review_comment] if current_user&.admin?
    params.require(:proposal).permit(permitted)
  end

  def authorize_proposal_editing
    unless current_user == @proposal.user || @proposal.co_authors.accepted.exists?(user_id: current_user.id)
      redirect_to proposals_path, alert: "You are not authorized to edit \'#{@proposal.title}\'' with author #{@proposal.user.name} proposal."
    end
  end
end
