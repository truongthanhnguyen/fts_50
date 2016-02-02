class Question < ActiveRecord::Base
  belongs_to :subject
  has_many :answers
  has_many :results
  enum question_type: [:single_choice, :multiple_choice, :text]
  
  accepts_nested_attributes_for :answers, allow_destroy: true
  validates :content, presence: true
end
