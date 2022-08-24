class UsersController < ApplicationController
  def index
    @user = User.all
    render json: @user
  end

  def create
    user = User.new(params.require(:user).permit(:email, :name))
    if user.save
      render json: user
    else
      render json: user.errors.full_messages, status: 422
    end
  end

  def show
    user = User.find_by("id = #{params[:id]}")
    # debugger
    if user
      render json: user
    else
      # raise error
      render json: user status: 422
    end
  end
end