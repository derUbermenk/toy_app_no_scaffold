class UsersController < ApplicationController
  before_action :set_user, only: [:new, :show, :edit, :destroy]

  def index
    @users = User.all
  end

  def show; end

  def new; end

  def create
    @user = User.new(user_params)

    if @user.save
      redirect_to @user, notice: 'user created successfully'
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit; end

  def update
    if @user.save
      redirect_to @user, notice: 'user updated successfully'
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @user.destroy


    redirect_to users_path, notice: 'micropost destroyed'
  end

  private

  def set_user
    @user = params[:id] ? User.find(params[:id]) : @user = User.new
  end

  def user_params
    Params.require(:user).permit(:name, :email)
  end
end
