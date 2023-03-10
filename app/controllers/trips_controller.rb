class TripsController < ApplicationController
  before_action :set_trip, only: %i[show destroy]

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
      redirect_to trip_path
    else
      render :new, status: :unprocessable_entity
    end
  end

  def show
    @trip = Trip.find(params[:id])
    @markers = @trip.activities.geocoded.map do |activity|
      {
        lat: activity.latitude,
        lng: activity.longitude
      }
    end
    # authorize @trip
    @dates = (@trip.starting_date..@trip.ending_date).to_a

    # [
    #   ["date du jour", [ la liste des activités que je dois afficher ce jour là]]
    # ]
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
