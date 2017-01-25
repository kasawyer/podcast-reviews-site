class AdminsController < ApplicationController
  def new
    @admin = Admin.new
  end

  def create
    @admin = Admin.new(admin_params)
    @admin.avatar = admin_params[:avatar]

    if @admin.save
      flash[:notice] = "Admin added successfully"
      redirect_to root_path
    else
      flash.now[:notice] = @admin.errors.full_messages
      render :new
    end
  end

  private

  def admin_params
    params.require(:admin).permit(:name, :email, :password, :remember_me,
      :avatar, :avatar_cache, :remove_avatar)
  end
end
