class UsersController < ApplicationController
  def index
    @users = User.all
    @users ||= []
  end

  def show
    @user = User.find(params[:id])
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    @user.avatar = user_params[:avatar]

    if @user.save
      flash[:notice] = "User added successfully"
      redirect_to user_path(@user)
    else
      flash.now[:notice] = @user.errors.full_messages
      render :new
    end
  end

  def destroy
    @user = User.find(params[:id])
    if admin_signed_in?
      @user.destroy
      redirect_to users_path
      flash[:notice] = "User was successfully deleted."
    else
      flash.now[:notice] = "You must be an admin to delete users!"
    end
  end

  private

  def user_params
    params.require(:user).permit(:name, :email, :password, :remember_me,
      :avatar, :avatar_cache, :remove_avatar)
  end
end
