class CoAuthorsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_proposal

  # GET /proposals/:proposal_id/co_authors
  def index
    @co_authors = @proposal.co_authors.includes(:user)
  end

  # POST /proposals/:proposal_id/co_authors
  def create
    user = User.find_by(email: params[:email])

    if user.nil?
      redirect_to proposal_path(@proposal), alert: "User not found."
      return
    end

    if @proposal.co_authors.exists?(user_id: user.id)
      redirect_to proposal_path(@proposal), alert: "User is already a co-author."
      return
    end

    @proposal.co_authors.create!(user: user, status: :invited)
    redirect_to proposal_path(@proposal), notice: "Co-author invited successfully."
  end

  # PATCH /proposals/:proposal_id/co_authors/:id
  def update
    co_author = @proposal.co_authors.find(params[:id])

    if co_author.user == current_user || current_user == @proposal.user
      co_author.update!(status: params[:status])
      redirect_to @proposal, notice: "Co-author status updated."
    else
      redirect_to @proposal, alert: "Not authorized to update status."
    end
  end

  private

  def set_proposal
    @proposal = Proposal.find(params[:proposal_id])
  end
end
