class ActivitiesController < ApplicationController
  before_action :set_activity, only: %i[show destroy]
  # skip_before_action :authenticate_user!, only: %i[index show]

  def index
    @activities = Activity.all
    if params[:query].present? || params.dig(:activity, :categories).present?
      # Je recherche toutes les activités qui ont lieu dans la ville donnée
      @activities = @activities.where(city: params[:query].capitalize) if params[:query].present?
      @activities = @activities.tagged_with(params.dig(:activity, :categories), :any => true) if params.dig(:activity, :categories).present?
      render partial: "trips/activity_list", locals: { filtered_activities: @activities }, layout: false, formats: :html
    else
    end
  end

  def show
    authorize @activity
  end

  def edit
    @activity = Activity.find(params[:id])
    authorize @activity
  end

  def update
    @activity = Activity.find(params[:id])
    @activity.update(activity_params)
    redirect_to activity_path(@activity)
    authorize @activity
  end

  def new
    @activity = Activity.new
    @activity.user = current_user
    authorize @activity
  end

  def create
    @activity = Activity.new(activity_params)
    @activity.user = current_user
    authorize @activity
      if @activity.save
      redirect_to activity_path(@activity)
      else
       render :new, status: :unprocessable_entity
      end
  end

  def destroy
    @activity.destroy
    redirect_to activities_path
    authorize @activity
  end

  private

  def set_activity
    @activity = Activity.find(params[:id])
  end

  def activity_params
    params.require(:activity).permit(:price_per_day, :name, :description, :category, :address, :beginning_date, :end_date, photos: [])
  end
end
