json.extract! event, :id, :location, :day, :month, :year, :title, :description, :created_at, :updated_at
json.url event_url(event, format: :json)
