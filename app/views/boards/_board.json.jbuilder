json.extract! board, :id, 
                     :title,
                     :abstract,
                     :detail,
                     :campus_name_id,
                     :laboratory,
                     :start_day,
                     :finish_day,
                     :place,
                     :reward_present,
                     :reward_content,
                     :required_number,
                     :contact_detail, 
                     :public_end_date, 
                     :created_at, 
                     :updated_at
json.url board_url(board, format: :json)
