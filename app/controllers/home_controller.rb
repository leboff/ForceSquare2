class HomeController < ApplicationController
  before_filter :authenticate_user!, :except => :index
  def index
    if user_signed_in?
      #redirect to somewhere else
    else
      respond_to do |format|
        format.html
      end
    end
  end
  def salesforce
    if current_user.salesforce_orgs.nil?
      respond_to do |format|
        format.html
      end
    else
      redirect_to '/settings'
    end
  end
  def settings
    respond_to do |format|
      format.html
    end
  end
end