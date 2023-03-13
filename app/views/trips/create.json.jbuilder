if @trip.persisted?
  json.form render(partial: "trips/form", formats: :html, locals: { trip: @trip })
  json.inserted_item render(partial: "trips/activity-options", formats: :html, locals: { trip: @trip })
else
  json.form render(partial: "trips/form", formats: :html, locals: { trip: @trip })
end
