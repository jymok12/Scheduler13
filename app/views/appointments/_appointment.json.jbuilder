json.extract! appointment, :id, :image, :title, :duration, :category, :level, :description, :created_at, :updated_at
json.url appointment_url(appointment, format: :json)
