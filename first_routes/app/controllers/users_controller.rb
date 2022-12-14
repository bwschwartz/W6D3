class UsersController < ApplicationController
  def index
    @user = User.all
    render json: @user
  end

  def create
    user = User.new(user_params)
    if user.save
      render json: user
    else
      render json: user.errors.full_messages, status: 422
    end
  end

  def show
    user = User.find_by("id = #{params[:id]}") #potentially unsafe
    render json: user
  end

  def update
    user = User.find(params[:id])
    if !user_params.empty?
      user.update(user_params)
      render json: user
    else
      render plain: "fuck"
      # render json: user.errors.full_messages, status:422
    end
  end

  def destroy
    user = User.find(params[:id])
    user.destroy
    render json: user
  end

  private

  def user_params
    params.require(:user).permit(:username)
  end
end
