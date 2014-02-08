json.array!(@events) do |event|
  json.extract! event, :id, :name, :subject_id, :starts_at, :ends_at, :event_duration_in_minutes
  json.url event_url(event, format: :json)
end
