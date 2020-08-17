class Quiz < ApplicationRecord
    has_many :quiz_results
    has_many :users, through: :quiz_results
end
