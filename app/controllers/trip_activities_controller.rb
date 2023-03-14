class TripActivitiesController < ApplicationController
  def update

    @activity = Activity.find(params[:activity_id])
    @trip = Trip.find(params[:trip_id])
    @trip_activity = TripActivity.find_by(trip_id: params[:trip_id], activity: params[:activity_id])
    @trip_activity.start_at = TripActivity.can_start_at.first
    # 1. Je dois récupérer l'info sur la journée sélectionnée - params[:date] _ DateTime.parse(params[:date])
    @dates = (@trip.starting_date..@trip.ending_date).to_a

    # 2. Je checked si à cette date j'ai déjà des trips activities
    date_trip_activities = TripActivity.find_trip_activities(@trip.id, params[:date])
    # 3. Si aucune, je précise que la trip_activity commencera le matin
    if nil
      @trip_activity.start_at.beginning_of_day + 8.hours
    else
      # 4. Si il y en a, Je dois vérifie s'il y a de la place sur ce jour
      @trip_activity.insertable_in_day?
    end

    # 5. Si insertable_in_day? est false, j'envoie une alerte en disant pas possible de faire ça !
    if @trip_activity.insertable_in_day? == false
      puts "Navré, mais tu ne peux pas réserver"
    else
    # 6. Si insertable_in_day? est true, récupérer le premier créneau disponible -> can_start_at.first
      @trip_activity.can_start_at.first
    end
    # 6a. Je dois raffiner les créneaux de can_start_at en fonction de l'open hours et closing hours de l'activity
    @trip_activity.end_at = @trip_activity.start_at + @activity.duration.hours
    @trip_activity.save
  end
end
