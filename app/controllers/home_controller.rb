class HomeController < ApplicationController
  before_filter :authenticate_user!, :except => :index
  def index
    if user_signed_in? && params[:override] != '1'
      redirect_to '/settings'
    else
      respond_to do |format|
        format.html
      end
    end
  end
  def salesforce
    if current_user.salesforce_orgs.empty? or params[:override] == '1'
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