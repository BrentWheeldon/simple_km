class SimpleKM::Client
  DEFAULT_URI_PARAMS = {
    scheme: "https",
    host: "trk.kissmetrics.com",
    path: "e"
  }

  attr_reader :api_key, :user_identifier

  def initialize options
    @api_key = options[:api_key]
    @user_identifier = options[:user_identifier]

    raise ArgumentError unless api_key && user_identifier
  end

  def record action, data
    data ||= {}
    raise ArgumentError unless data.is_a?(Hash)

    query_values = {
      _k: api_key,
      _p: user_identifier,
      _n: action,
    }.merge(data)
    uri = Addressable::URI.new(DEFAULT_URI_PARAMS.merge(query_values: query_values))

    HTTParty.get(uri.to_s)
  end
end
