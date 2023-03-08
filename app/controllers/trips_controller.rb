class TripsController < ApplicationController
  before_action :set_booking, only: %i[show destroy]

  def new
    @trip = Trip.new
    # authorize @trip
  end

  def create
    @trip = Trip.new(trip_params)
    # authorize @trip
    if @trip.save
      redirect_to trip_path
    else
      render :new, status: :unprocessable_entity
    end
  end

  def show
  end

  # def destroy
  #   # authorize @trip
  #   @trip.destroy
  #   redirect_to dashboard_path
  # end

  private

  def set_trip
    @trip = Trip.find(params[:id])
  end

  def trip_params
    params.require(:trip).permit(:user_id, :budget, :strating_date, :ending_date, :trip_name)
  end
end
