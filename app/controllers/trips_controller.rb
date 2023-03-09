class TripsController < ApplicationController
  before_action :set_booking, only: %i[show destroy]

  def new

    @trip = Trip.new
    @activities = Activity.all
    # authorize @trip
    @trip.category_list.add(params[:activity][:categories]) if params[:activity].present?
    @categories = @trip.category_list
    # 1. Filtrer les activités en fonction de @categories
    @filtered_activities = @activities.tagged_with(@categories, :any => true)

  end

  def create
    @trip = Trip.new(trip_params)
    # authorize @trip
    if @trip.save
      raise
      redirect_to trip_path(set_trip)
    else
      render :new, status: :unprocessable_entity
    end
  end

  def show
    set_trip
    # authorize @trip
    @trip_activities = Trip_activity.all { |trip_activity| trip_activity.activity }
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
    params.require(:trip).permit(:user_id, :budget, :starting_date, :ending_date, :category_list)
  end
end
