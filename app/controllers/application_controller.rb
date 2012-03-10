class ApplicationController < ActionController::Base
  protect_from_forgery
  def bitly
    Bitly.use_api_version_3
    @bitly = Bitly.new('leboff', 'R_a08016d3520db7a24658de32f04dc51b') unless @bitly
  end
  def after_sign_in_path_for(resource_or_scope)
       '/salesforce'
  end
end
