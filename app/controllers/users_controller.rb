class UsersController < ApplicationController
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
      # u.avatar.url # => '/url/to/file.png'
      # u.avatar.current_path # => 'path/to/file.png'
      # u.avatar_identifier # => 'file.png'
      flash[:notice] = "User added successfully"
      redirect_to user_path(@user)
    else
      flash.now[:notice] = @user.errors.full_messages
      render :new
    end
  end

  def update
    # NEEDS TO HANDLE AVATAR
  end

  private

  def user_params
    params.require(:user).permit(:name, :email, :password, :remember_me, :avatar,
      :avatar_cache, :remove_avatar)
  end
end
