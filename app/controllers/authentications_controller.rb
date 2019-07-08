# This controller exposes a route /auth/login
# that accepts suer credentials and returns a JSON response with
# the result

class AuthenticationsController < ApplicationController
  # return an auth token once user is authenticated
  def authenticate
    auth_token =
      AuthenticateUser.new(auth_params[:email], auth_params[:password]).call
    json_response(auth_token: auth_token)
  end

  private

  def auth_params
    paams.permit(:emai, :password)
  end
end
