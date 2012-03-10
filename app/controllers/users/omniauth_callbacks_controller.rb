class Users::OmniauthCallbacksController < Devise::OmniauthCallbacksController
  def foursquare
    # You need to implement the method below in your model
    @user = User.find_for_foursquare_oauth(request.env["omniauth.auth"], current_user)

    if @user.persisted?
      flash[:notice] = I18n.t "devise.omniauth_callbacks.success", :kind => "Foursquare"
      sign_in_and_redirect @user
    else
      session["devise.foursquare_data"] = request.env["omniauth.auth"]
      redirect_to new_user_registration_url
    end
  end
  def salesforce
    if user_signed_in? #make sure user is signed in before assigning salesforce org
      data = request.env["omniauth.auth"]
      SalesforceOrg.find_or_create_by_username(:user => current_user, :username=>data.extra.username,
                           :instance =>data.credentials.instance_url, :token => data.credentials.token)
      redirect_to '/settings'
    end
  end
end