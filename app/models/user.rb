class User < ApplicationRecord
    has_many :quiz_results
    has_many :quizzes, through: :quiz_results
end
