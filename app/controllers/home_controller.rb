class HomeController < ApplicationController
  def index
    if user_signed_in?
      #redirect to somewhere else
    else
      respond_to do |format|
        format.html
      end
    end
  end
end