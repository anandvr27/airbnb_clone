json.extract! reservation, :id, :listing_id, :start_date, :end_date, :created_at, :updated_at
json.url reservation_url(reservation, format: :json)