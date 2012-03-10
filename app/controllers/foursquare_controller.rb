class FoursquareController < ApplicationController
  def index
    Rails.logger.info params.to_yaml
  end
end