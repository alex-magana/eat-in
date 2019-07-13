class ApiVersion
  attr_reader :version, :default

  def initialize(version, default = false)
    @version = version
    @default = default
  end

  # implement a `matches?` method as per the requirements of advanced
  # constraints provided via rails routing
  # method, `matches?` is invoked with the request ibject on initializaiton
  # of the class.
  # check whether version is specified or is default
  # this is referred to as content negotiation
  def matches?(request)
    check_headers(request.headers) || default
  end

  private

  def check_headers(headers)
    # check version from the Accept headers; expect
    # custom media type `restaurants`
    accept = headers[:accept]
    accept && accept.include?("application/vnd.restaurants.#{version}+json")
  end
end