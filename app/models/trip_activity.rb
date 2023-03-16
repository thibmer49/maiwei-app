class TripActivity < ApplicationRecord
  belongs_to :trip
  belongs_to :activity

  scope :find_trip_activities, -> (trip_id, date) { where(trip_id: trip_id).where("start_at >= ? AND start_at <= ?", DateTime.parse(date.to_s), DateTime.parse(date.to_s).end_of_day) }

  def scheduled_hours
    get_hours(start_at, end_at + 1.hour)
  end

  def all_day_hours
    get_hours(start_at.beginning_of_day + 8.hours, start_at.beginning_of_day + 21.hours)
  end

  def insertable_in_day?(remaining_hours)
    !can_start_at(remaining_hours).blank?
  end

  def can_start_at(remaining_hours)
    remaining_hours.select do |slot|
      get_hours(slot, slot + activity.duration.hour).select{|slotty| remaining_hours.include?(slotty)}.count == get_hours(slot, slot + activity.duration.hour).count
    end
  end

  def formated_date
    I18n.l(start_at, format: "%A %e %B")
  end

  private

  def get_hours(start_at, end_at)
    (start_at.to_i..end_at.to_i).step(30.minutes).to_a.map{|date| Time.at(date).to_datetime }
  end
end
