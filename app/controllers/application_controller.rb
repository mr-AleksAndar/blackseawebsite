# app/controllers/application_controller.rb
class ApplicationController < ActionController::Base
  helper_method :canonical_url

  def canonical_url
    uri = URI.parse(request.original_url)

    uri.scheme = "https"
    uri.host   = "blacksea.surf"          # <- your preferred host

    # strip tracking params & fragments
    params = Rack::Utils.parse_nested_query(uri.query).except(
      "utm_source","utm_medium","utm_campaign","utm_term","utm_content","gclid","fbclid"
    )
    uri.query    = params.presence&.to_query
    uri.fragment = nil

    uri.to_s
  end
end