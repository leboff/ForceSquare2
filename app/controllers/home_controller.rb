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
    respond_to do |format|
      format.html
    end
  end
  def settings
    respond_to do |format|
      format.html
    end
  end
end