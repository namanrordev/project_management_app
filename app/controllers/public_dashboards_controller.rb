class PublicDashboardsController < ApplicationController
  def index
    @proposals = Proposal
      .where(implementation_status: %w[approved in_progress completed])
      .includes(:progress_updates)
  end
end
