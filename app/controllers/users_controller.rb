# frozen_string_literal: true

class UsersController < ApplicationController
  skip_before_action :authenticate_request, only: :create

  def create
    user = User.create!(user_params)
    token = AuthenticateUser.call(user.email, user.password)
    response = { message: "Welcome #{user.name}, account created successfully", token: token }
    render json: response, status: :created
  end

  private

  def user_params
    params.permit(:name, :email, :password, :password_confirmation)
  end
end
