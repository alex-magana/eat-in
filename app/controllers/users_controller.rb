class UsersController < ApplicationController
  # POST /signup
  # return authenticated token upon signup
  def create
    # create! raises ActiveRecord::RecordInvalid unlike create
    user = User.create!(user_params)
    auth_token = Authenticate.new(user.email, user.password).call
    response = { message: Message.account_created, auth_token: auth_token }
    json_response(response)
  end

  private

  def user_params
    params.permit(
      :name,
      :email,
      :password,
      :password_confirmation
    )
  end
end
