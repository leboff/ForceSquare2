class FoursquareController < ApplicationController
  def index
    data = json.parse(param[:checkin])
    Rails.logger.warn data.to_yaml
  end
end