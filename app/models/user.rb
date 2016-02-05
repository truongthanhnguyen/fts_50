class User < ActiveRecord::Base
  enum role: [:user, :admin]
  devise :database_authenticatable, :registerable, :rememberable, :validatable, :timeoutable
  has_many :exams
  has_many :questions, dependent: :destroy
  has_many :results
end
