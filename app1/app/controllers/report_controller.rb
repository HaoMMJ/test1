class ReportController < ApplicationController
  def recent_items
    items = Seed.where(group: 1).order(updated_at: :desc).limit(10).select("label, is_consumed")
    render json: items
  end
end