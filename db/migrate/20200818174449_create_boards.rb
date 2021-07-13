class CreateBoards < ActiveRecord::Migration[5.2]
  def change
    create_table :boards do |t|
      t.string  :title,           null: false
      t.text    :abstract,        null: false
      t.text    :detail,          null: false
      t.integer :campus_name_id,  null: false, unsigned: true
      t.string  :laboratory,      null: false, default: ""
      t.date    :start_day,       null: false
      t.date    :finish_day,      null: false
      t.string  :place,           null: false, default: ""
      t.boolean :reward_present,  null: false, defalut: false
      t.string  :reward_content,  null: false, default: ""
      t.integer :required_number, null: false, unsigned: true
      t.string  :contact_detail,  null: false
      t.date    :public_end_date, null: false
      t.integer :user_id,         null: false, unsigned: true

      t.timestamps
    end
  end
end
