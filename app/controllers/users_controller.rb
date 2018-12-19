class UsersController < ApplicationController
  def dashboard
  end

  def edit_profile
    @user = current_user
  end

  def update
    @user = User.find(current_user.id)
    @user.update(params_update)
    @user.remote_photo_url = params[:user][:photo] if params[:user][:photo]
    if @user.save
      redirect_to dashboard_path
    else
      render :edit_profile
    end

  end

  private

  def params_update
    params.require(:user).permit(:name, :age, :gender, :location)
  end
end
