class ReportController < ApplicationController
  def recent_items
    items = AppOne::Seed.order(updated_at: :desc).limit(10).select("label, is_consumed")
    render json: items
  end
end