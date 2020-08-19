json.extract! board, :id, :title, :abstract, :detail, :campus_name_id, :laboratory, :start_day, :finish_day, :place, :reward_id, :reward_content, :number, :charge, :contact, :endline, :created_at, :updated_at
json.url board_url(board, format: :json)
