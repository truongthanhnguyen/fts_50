class AddTimeSetToExams < ActiveRecord::Migration
  def change
    add_column :exams, :time_start, :integer
    add_column :exams, :time_end, :integer
  end
end
