class AvailabilitiesController < ApplicationController
  def index
    @availabilities = current_user.availabilities
    @availability = Availability.new
  end

  def create
    @availability = Availability.new(date_params)
    @availability.user = current_user
    if @availability.save!
      redirect_to availabilities_path
    else
      render :index
    end
  end

  def destroy
    @availability = Availability.find(params[:id])
    @availability.destroy!
    redirect_to availabilities_path
  end

  private
  def date_params
    params.require(:availability).permit(:date)
  end
end
