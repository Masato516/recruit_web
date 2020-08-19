class CreateBoards < ActiveRecord::Migration[5.2]
  def change
    create_table :boards do |t|
      t.string :title
      t.text :abstract
      t.text :detail
      t.integer :campus_name_id
      t.string :laboratory
      t.date :start_day
      t.date :finish_day
      t.string :place
      t.integer :reward_id
      t.string :reward_content
      t.integer :number
      t.string :charge
      t.string :contact
      t.date :endline

      t.timestamps
    end
  end
end
