json.extract! student, :id, :photo, :first_name, :last_name, :user_id, :account_id, :created_at, :updated_at
json.url student_url(student, format: :json)
