class AddFacultyIdToUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :faculty_id, :integer
  end
end
