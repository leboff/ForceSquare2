
class FoursquareController < ApplicationController
  def index
    data = JSON.parse(param[:checkin])
    Rails.logger.warn data.to_yaml
  end
end