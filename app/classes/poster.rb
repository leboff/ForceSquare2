require 'rubygems'
require 'httparty'
class Poster
   include HTTParty
   format :json

  def initialize(data)
    mdata = Hashie::Mash.new(data)
    @id = mdata.user.id
    @venue_name = mdata.venue.name
    @checkin_id = mdata.id
    @bitly = Bitly.new('leboff', 'R_a08016d3520db7a24658de32f04dc51b')
  end
  def post_to_salesforce
    the_user.salesforce_orgs.each do |org|
        headers =  {'Content-Type' => 'application/x-www-form-urlencoded', 'Authorization' => 'OAuth ' + access_token(org.instance, org.token) }
        options ={ :body =>{ :text => "I just checked in to #{@venue_name} on Forcesquare! " + url, },
                :headers =>  headers }
        resp = self.class.post(org.instance+'/services/data/v23.0/chatter/feeds/to/me/feed-items', options)
    end
  end
  def the_user
    User.find_by_foursquare_id(@id)
  end
  def url
     @bitly.shorten(the_user.foursquare_url + '/checkin/' +@checkin_id ).short_url
  end
  def access_token(instance, refresh)
    headers =  {'Content-Type' => 'application/x-www-form-urlencoded'}
    options = {:headers=>headers, :body =>{ :grant_type => 'refresh_token', :client_id => SALESFORCE_ID, :client_sercret => SALESFORCE_SECRET, :refresh_token => refresh}}
    resp = self.class.post(instance + '/services/oauth2/token', options)
    resp["access_token"]
  end

end