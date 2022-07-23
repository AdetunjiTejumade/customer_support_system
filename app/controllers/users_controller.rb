# frozen_string_literal: true

class UsersController < ApplicationController
  skip_before_action :authenticate_request, only: :create

  def create
    user = User.new(user_params)
    if user.save
      token = AuthenticateUser.call(user.email, user.password)
      response = { message: "Welcome #{user.name}, account created successfully", token: token }
      render json: response, status: :created
    else
      render json: { message: "Validation failed: Password can't be blank, Name can't be blank, Email can't be blank, Email is invalid, Password digest can't be blank, Password digest is too short (minimum is 6 characters)" },
             status: :unprocessable_entity
    end
  end

  private

  def user_params
    params.permit(:name, :email, :password, :password_confirmation)
  end
end
