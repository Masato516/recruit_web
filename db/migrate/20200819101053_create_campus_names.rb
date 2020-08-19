class CreateCampusNames < ActiveRecord::Migration[5.2]
  def change
    create_table :campus_names do |t|
      t.string :name

      t.timestamps
    end
  end
end
