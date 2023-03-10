class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: %i[home]

  def home
  end

  def dashboard
    @user = current_user
    @time = Time.now.strftime("%H:%M")
    @date = Time.now.strftime('%A %-d %B %Y')
    @trips = current_user.trips
    @activities = Activity.all
    @markers = @activities.geocoded.map do |activity|
      {
        lat: activity.latitude,
        lng: activity.longitude
      }
    end
  end
end
