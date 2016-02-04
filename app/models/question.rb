class Question < ActiveRecord::Base
  belongs_to :subject
  belongs_to :user
  has_many :answers, dependent: :destroy
  has_many :results
  enum question_type: [:single_choice, :multiple_choice, :text]
  enum status: [:waitting, :accepted]

  accepts_nested_attributes_for :answers, allow_destroy: true
  validates :content, presence: true
end
