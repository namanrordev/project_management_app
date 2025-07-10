class ProgressUpdatesController < ApplicationController
  before_action :set_proposal

  def index
    @progress_updates = @proposal.progress_updates.order(created_at: :desc)
  end

  def new
    @progress_update = @proposal.progress_updates.build
  end

  def create
    @progress_update = @proposal.progress_updates.build(progress_update_params)
    @progress_update.user = current_user

    if @progress_update.save
      redirect_to proposal_progress_updates_path(@proposal), notice: "Progress update added."
    else
      render :new
    end
  end

  private

  def set_proposal
    @proposal = Proposal.find(params[:proposal_id])
  end

  def progress_update_params
    params.require(:progress_update).permit(:title, :description, :status, :percent_done, evidences: [])
  end
end
