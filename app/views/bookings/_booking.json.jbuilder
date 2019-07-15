json.extract! booking, :id, :status, :title, :start, :cancellation_reason, :trainer_id, :schedule_id, :lesson_id, :account_id, :created_at, :updated_at
json.url booking_url(booking, format: :json)
