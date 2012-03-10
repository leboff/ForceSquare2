
class FoursquareController < ApplicationController
  def index
    data = JSON.parse(params[:checkin])
    p = Poster.new(data)
    p.post_to_salesforce
  end
end