class ApplicationController < ActionController::Base
  protect_from_forgery

  def after_sign_in_path_for(resource_or_scope)
       '/salesforce'
  end
  def new_user_session(resource_or_scope)
    '/'
  end
end
