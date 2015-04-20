json.array!(@appointment_imports) do |appointment_import|
  json.extract! appointment_import, :id, :start_date, :start_time, :end_date, :end_time, :first_name, :last_name, :comments
  json.url appointment_import_url(appointment_import, format: :json)
end
