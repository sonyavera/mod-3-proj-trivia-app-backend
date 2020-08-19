require 'httparty'
require 'json'
require 'active_record'

class Quiz < ActiveRecord::Base
     has_many :quiz_results
     has_many :users, through: :quiz_results

    #  def initialize(quiz_params){
    #      quiz = Quiz.find_or_create_by(quiz_params)
    #      if !quiz.id 
    #         self.category_id = Quiz.get_category_id(quiz.category)
    #      end
    #      quiz_result = QuizResult.find_or_create_by()
    #      self.category = quiz_params[category]
    #  }

    def self.generate_quiz(category, difficulty)
        category_id = get_category_id(category)
        response = HTTParty.get("https://opentdb.com/api.php?amount=10&category=#{category_id}&difficulty=#{difficulty}&type=multiple")
        questions_json = JSON.parse(response.body)["results"]
    end

    def self.create_categories
        response = HTTParty.get("https://opentdb.com/api_category.php")
        category_list = JSON.parse(response.body)
        category_arr = []
        category_list["trivia_categories"].each do |category|
            category_arr.push(category["name"])
        end
    end

    def self.get_category_id(category_name)
        response = HTTParty.get("https://opentdb.com/api_category.php")
        category_json = JSON.parse(response.body)
        category = category_json["trivia_categories"].find do |cat|
            cat["name"] == "#{category_name}"
        end 
        category_id = category["id"]
        return category_id
    end
end





