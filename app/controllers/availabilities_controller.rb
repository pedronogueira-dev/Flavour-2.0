class AvailabilitiesController < ApplicationController
  def index
    @availabilities = current_user.availabilities
    @availability = Availability.new
  end

  def create
    @availabilities = current_user.availabilities
    @availability = Availability.new(date_params)
    #@availability = Availability.new(params[:date])
    @availability.user = current_user
    if @availability.save
      redirect_to availabilities_path
    else
      render :index
    end
  end

  def destroy
    # @availability = Availability.find(params[:id])
    @availability = current_user.availabilities.find_by(date: params[:date])
    @availability.destroy

    respond_to do |format|
      format.html { redirect_to ponies_url }
      format.json { head :no_content }
      format.js
    end
  end

  private
  def date_params
    params.require(:availability).permit(:date)
  end
end
