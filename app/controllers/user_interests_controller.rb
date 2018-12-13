class UserInterestsController < ApplicationController
  def index
    @interests = current_user.user_interests
  end

  def edit
    @interests = current_user.user_interests
  end

  def update
    @interest = current_user.user_interests.find(params[:id])
    @interest.update(user_interests_params)
    if @interest.save!
      redirect_to interests_edit_path
    else
      redirect_to interests_edit_path
    end
  end

  private

  def user_interests_params
    params.require(:user_interest).permit(:active)
  end
end
