json.array!(@appointments) do |appointment|
  json.extract! appointment, :id, :start_date, :start_time, :end_date, :end_time, :first_name, :last_name, :comments
  json.url appointment_url(appointment, format: :json)
end
