class SalesforceOrgsController <ApplicationController
  def delete
    #check that this is the users org
    org = SalesforceOrg.find(params[:id])
    if org
      if org.user = current_user
        org.destroy

      end
    end
    redirect_to '/settings'
  end
end