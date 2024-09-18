json.extract! event, :id, :title, :description, :location, :capacity, :date, :time, :host, :created_at, :updated_at
json.url event_url(event, format: :json)
