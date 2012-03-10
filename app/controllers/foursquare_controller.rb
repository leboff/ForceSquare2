
class FoursquareController < ApplicationController
  def index
    data = JSON.parse(params[:checkin]) if params[:checkin]
    if data
      p = Poster.new(data)
      if p.post_to_salesforce
        render :text=> 'completed successfully', :success=>true, :status=> :ok
      else
        render :text=> 'unauthorized request', :success=>false, :status => :unauthorized
      end
    else
      render :text => 'bad or no data sent', :success=>true, :status => :unprocessable_entity
    end

  end
end