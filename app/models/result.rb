class Result < ActiveRecord::Base
  belongs_to :user
  belongs_to :exam
  belongs_to :question
  belongs_to :answer

  scope :correct, -> {joins(:answer).where answers: {correct_answer: true}}
end
