class Api::UsersController < ApplicationController


  def show
    if current_user
      @user = current_user
      render "show.json.jbuilder"
    else
      render json: []
    end
  end

  def create
    user = User.new(
      name: params[:name],
      email: params[:email],
      password: params[:password],
      password_confirmation: params[:password_confirmation]
    )

    if user.save
      render json: {message: 'User created successfully'}, status: :created
    else
      render json: {errors: user.errors.full_message}, status: :bad_request
    end
  end




end
