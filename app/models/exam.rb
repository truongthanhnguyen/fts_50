class Exam < ActiveRecord::Base

 
  belongs_to :user
  belongs_to :subject
  has_many :results
  has_many :questions, through: :results

  enum status: [:start, :testing, :unchecked, :checked]
  accepts_nested_attributes_for :results

  before_create :add_questions

  private
  def add_questions
    self.questions = subject.questions.order("RANDOM()").limit Settings.NUMBER_QUESTIONS
  end
end
