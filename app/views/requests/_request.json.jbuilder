json.extract! request, :id, :name, :date, :practice_id, :first_name, :last_name, :mobile, :email, :subscriber, :category_id, :note, :operator_id, :processed, :updater, :unprocessable, :unprocessable_reason, :created_at, :updated_at
json.url request_url(request, format: :json)
