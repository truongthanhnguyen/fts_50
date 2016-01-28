class User < ActiveRecord::Base
  devise :database_authenticatable, :registerable, :rememberable, :validatable, :timeoutable
  has_many :exams
  has_many :results
end
