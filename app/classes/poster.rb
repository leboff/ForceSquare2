require 'httparty'
class Poster
  def initialize(data)
    mdata = Mash.new(data)
    @id = mdata.user.id
    @venue_name = mdata.venue.name
    @checkin_id = mdata.id
  end
  def post_to_salesforce
    the_user.salesforce_orgs.each do |org|
        @headers =  {'Content-Type' => 'application/x-www-form-urlencoded', 'Authorization' => 'OAuth ' + org.token }
        options ={ :body =>{ :text => "I just checked in to #{@venue_name} on Forcesquare! " + url, },
                :headers =>  @headers }
        resp = self.class.post(org.instance+'/services/data/v23.0/chatter/feeds/to/me/feed-items', options)
    end
  end
  def the_user
    User.find_by_foursquare_id(@id).first
  end
  def url
     bitly.shorten(the_user.foursquare_url + '/checkin/' +checkin_id ).short_url
  end
end