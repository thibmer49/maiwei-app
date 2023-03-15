class TripActivitiesController < ApplicationController
  def update
    @trip_activity = TripActivity.find(params[:id])
    @trip = @trip_activity.trip
    @activity = @trip_activity.activity
    # 1. Je dois récupérer l'info sur la journée sélectionnée - params[:date] _ DateTime.parse(params[:date])
    @date = DateTime.parse(params[:date])

    # 2. Je checked si à cette date j'ai déjà des trips activities
    date_trip_activities = TripActivity.find_trip_activities(@trip.id, params[:date]).to_a
    if date_trip_activities.include?(@trip_activity)
      date_trip_activities.delete_at(date_trip_activities.index(@trip_activity))
    end
    # 3. Si aucune, je précise que la trip_activity commencera le matin
    if date_trip_activities.blank?
      @trip_activity.start_at = @date.beginning_of_day + 9.hours
    else
      # 4. Si il y en a, Je dois vérifie s'il y a de la place sur ce jour
      remaining_hours = remaining_hours(date_trip_activities)
      if @trip_activity.insertable_in_day?(remaining_hours)
        # 6. Si insertable_in_day? est true, récupérer le premier créneau disponible -> can_start_at.first
        # 6a. Je dois raffiner les créneaux de can_start_at en fonction de l'open hours et closing hours de l'activity
        @trip_activity.start_at = @trip_activity.can_start_at(remaining_hours).first
      else
        # 5. Si insertable_in_day? est false, j'envoie une alerte en disant pas possible de faire ça !
        puts "Navré, mais tu ne peux pas réserver"
      end
    end
    @trip_activity.end_at = @trip_activity.start_at + @activity.duration.hours

    @trip_activity.save

    dates = (@trip.starting_date..@trip.ending_date).to_a

    @dates = dates.map do |date|
      [date, TripActivity.find_trip_activities(@trip.id, date).to_a]
    end

    respond_to do |format|
      format.html # Follow regular flow of Rails
      format.text { render partial: "trips/day_trip_list", locals: { trip: @trip, dates: @dates }, formats: [:html] }
    end
  end

  private

  def remaining_hours(date_trip_activities)
    all_day_hours - date_trip_activities.map{|trip_activity| trip_activity.scheduled_hours}.flatten
  end

  def all_day_hours
    get_hours(@date.beginning_of_day + 9.hours, @date.beginning_of_day + 22.hours)
  end

  def get_hours(start_at, end_at)
    (start_at.to_i..end_at.to_i).step(30.minutes).to_a.map{|date| Time.at(date).to_datetime }
  end

end
