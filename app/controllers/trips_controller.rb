class TripsController < ApplicationController
  before_action :set_trip, only: %i[show destroy]


  def index
    @activities = Activity.all
    if params[:query].present?
      @activities = @activities.where(city: params[:query].capitalize)
    end
    if params.dig(:activity, :categories).present?
      @activities = @activities.tagged_with(params.dig(:activity, :categories), any: true)
    end
    render partial: "trips/activity_list", locals: { filtered_activities: @activities }, layout: false, formats: :html
  end

  def filter_activities
    @activities = Activity.all
    if params[:city].present?
      @activities = @activities.where(city: params[:city].capitalize)
    end

    categories = URI.decode_www_form_component(params[:categories]).split(",")
    if !categories.blank?
      @activities = @activities.tagged_with(categories, any: true)
    end
    render partial: "trips/activity_list", locals: { filtered_activities: @activities }, layout: false, formats: :html
  end

  def new
    @trip = Trip.new()
    @activities = params[:query].present? ? Activity.where(city: params[:query].capitalize) : Activity.all
    # authorize @trip
    @trip.category_list.add(params[:activity][:categories]) if params[:activity].present?
    @categories = @trip.category_list

    # 1. Filtrer les activités en fonction de @categories
    @filtered_activities = @categories.blank? ? @activities : @activities.tagged_with(@categories, any: true)
  end

  def create
    @trip = Trip.new(trip_params.merge({ user: current_user }))
    @activities = Activity.all
    @filtered_activities = @activities.tagged_with(@categories, :any => true)
    # authorize @trip
    respond_to do |format|
      if @trip.save
        format.html { redirect_to trip_path(@trip) }
        format.text { render partial: "activity_list", locals: { activities: @activities }, formats: [:html] }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.text
      end
    end
  end

  def show
    @trip = Trip.find(params[:id])
    # @trip_activity = TripActivity.find(params[:trip_activity_id])
    @starting_date = @trip.starting_date.strftime('%A %-d %B %Y')
    @ending_date = @trip.ending_date.strftime('%A %-d %B %Y')
    @markers = @trip.activities.geocoded.map do |activity|
      {
        lat: activity.latitude,
        lng: activity.longitude,
        info_window_html: render_to_string(partial: "info_window", locals: {activity: activity})
    }
    end
    # authorize @trip
    dates = (@trip.starting_date..@trip.ending_date).to_a
    @dates = dates.map do |date|
      [date, TripActivity.find_trip_activities(@trip.id, date).to_a]
    end

  end

  def edit
    @trip = Trip.find(params[:id])
    @starting_date = @trip.starting_date.strftime('%A %-d %B %Y')
    @ending_date = @trip.ending_date.strftime('%A %-d %B %Y')
    @activities = Activity.all
    @trip.category_list.add(params[:activity][:categories]) if params[:activity].present?
    @categories = @trip.category_list
    @filtered_activities = Activity.tagged_with(@categories, any: true).where(city: params[:city])
    # authorize @trip
  end

  def update
    @trip = Trip.find(params[:id])
    @starting_date = @trip.starting_date.strftime('%A %-d %B %Y')
    @ending_date = @trip.ending_date.strftime('%A %-d %B %Y')
    @trip.update(trip_params)
    redirect_to trip_path(@trip)
    # authorize @trip
  end

  private

  def set_trip
    @trip = Trip.find(params[:id])
  end

  def trip_params
    params.require(:trip).permit(:user_id, :budget, :starting_date, :ending_date, :category_list, :photo, :trip_name, activity_ids: [])
  end

  def total_cost
    sum = 0
    sum += @trip_activity.trip.activity.price_per_visitor
  end
end
