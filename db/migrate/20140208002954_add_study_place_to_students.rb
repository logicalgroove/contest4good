class AddStudyPlaceToStudents < ActiveRecord::Migration
  def change
    add_column :students, :study_place, :string
  end
end
