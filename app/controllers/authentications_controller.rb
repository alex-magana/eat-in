# This controller exposes a route /auth/login
# that accepts suer credentials and returns a JSON response with
# the result

class AuthenticationsController < ApplicationController
  skip_before_action :authorize_request, only: :authenticate

  # return an auth token once user is authenticated
  def authenticate
    auth_token =
      AuthenticateUser.new(auth_params[:email], auth_params[:password]).call
    json_response(auth_token: auth_token)
  end

  private

  def auth_params
    params.permit(:email, :password)
  end
end
