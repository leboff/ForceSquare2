
class FoursquareController < ApplicationController
  def index
    data = JSON.parse(params[:checkin])
    Rails.logger.warn data.to_yaml
  end
end