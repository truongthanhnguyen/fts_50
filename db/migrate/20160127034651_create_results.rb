class CreateResults < ActiveRecord::Migration
  def change
    create_table :results do |t|
      t.integer :spent_time
      t.references :user, index: true, foreign_key: true
      t.references :exam, index: true, foreign_key: true
      t.references :question, index: true, foreign_key: true
      t.integer :answer_id

      t.timestamps null: false
    end
  end
end
