class UsersController < ApplicationController
	before_action :authorized, only: [:auto_login]

  # REGISTER
  def create
    @user = User.create(user_params)
    if @user.valid?
      token = encode_token({user_id: @user.id})
      render json: {user: @user, token: token}
    else
      render json: {error: "Invalid username or password"}
    end
  end

  def check_user
  	@user = User.find_by(username: params[:username])
  	if @user
  		if @user.user_type == params[:user_type]
	  		render json: {status: true, type: true}
	  	else
	  		render json: {status: false, type: false}
	  	end
  	else
  		render json: {status: false, type: true}
  	end
  end

  # LOGGING IN
  def login
    @user = User.find_by(username: params[:username])

    if @user && @user.authenticate(params[:password])
      token = encode_token({user_id: @user.id})
      render json: {user: @user, token: token}
    else
      render json: {error: "Invalid username or password"}
    end
  end


  def auto_login
    render json: @user
  end

  private

  def user_params
    params.permit(:username, :password, :user_type)
  end
end
