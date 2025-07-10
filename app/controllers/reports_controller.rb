class ReportsController < ApplicationController
  def financial_impact
    @proposals = Proposal.approved.includes(:proposal_costs)
    respond_to do |format|
      format.html
      format.pdf do
        render pdf: "financial_impact_report",                             # Filename
                      template: "reports/financial_impact_pdf",                   # View template path
                      formats: [:html],                                           # Required to force ERB parse
                      layout: false
      end
    end
  end
end
