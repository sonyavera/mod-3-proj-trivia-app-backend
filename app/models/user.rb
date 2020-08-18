require 'active_record'

class User < ActiveRecord::Base
    has_many :quiz_results
    has_many :quizzes, through: :quiz_results

    def self.test
        print "test"
    end 
end

User.test