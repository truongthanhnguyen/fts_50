class CreateExams < ActiveRecord::Migration
  def change
    create_table :exams do |t|
      t.integer :status
      t.integer :duration, :default => 20
      t.integer :number_question, :default => 30
      t.string :status
      t.references :user, index: true, foreign_key: true
      t.references :subject, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
