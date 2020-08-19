require 'active_record'

class QuizResult < ActiveRecord::Base
  # belongs_to :user
  belongs_to :quiz
end
