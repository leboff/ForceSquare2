
class FoursquareController < ApplicationController
  def index
    data = JSON.parse(params[:checkin])
    Rails.logger.warn data.to_yaml
    ##grab user id for user matching
  end
end