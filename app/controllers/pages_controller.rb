class PagesController < ApplicationController
  def home
  end

  def dashboard
    @user = current_user
    @time = Time.now.strftime("%H:%M")
    @date = Time.now.strftime('%A %-d %B %Y')
    @activities = Activity.all
    @markers = @activities.geocoded.map do |activity|
      {
        lat: activity.latitude,
        lng: activity.longitude
      }
    end
  end
end
