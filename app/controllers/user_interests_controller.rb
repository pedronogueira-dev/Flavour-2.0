class UserInterestsController < ApplicationController
  def index
    @interests = current_user.user_interests
  end

  def edit
    @interests = current_user.user_interests.sort
  end

  def update
    #@interest = current_user.user_interests.find(params[:id])
   @interest = UserInterest.find_by(user: current_user, id: params[:id])
    if @interest
      if @interest.update(user_interests_params)
        respond_to do |format|
          format.html { redirect_to interests_edit_path }
          format.js { head :ok } # <-- will render `app/views/user_interest/update.js.erb`
        end
      else
        respond_to do |format|
          format.html { render :edit }
          format.js { head :ok }  # <-- idem
        end
      end
    end
  end

  private

  def user_interests_params
    params.require(:user_interest).permit(:active)
  end
end
