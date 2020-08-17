require 'httparty'
require 'pp'
require 'json'

class Quiz < ApplicationRecord
    has_many :quiz_results
    has_many :users, through: :quiz_results

    def self.generate_quiz(category, difficulty)
        category_id = get_category_id(category)
        response = HTTParty.get("https://opentdb.com/api.php?amount=10&category=#{category_id}&difficulty=#{difficulty}&type=multiple")
        questions_json = JSON.parse(response.body)["results"]
        # questions_json.map do |question|
        #     question = {question, correct_answer, incorrect_answers}
        # end
        # we should be using destructuring here
        # get quiz data, render quiz data
        # decide when to move over to javascript
    end

    def self.create_categories
        response = HTTParty.get("https://opentdb.com/api_category.php")
        category_list = JSON.parse(response.body)
        category_arr = []
        category_list["trivia_categories"].each do |category|
            category_arr.push(category["name"])
        end
    end

    def self.get_category_id(category)
        response = HTTParty.get("https://opentdb.com/api_category.php")
        category_json = JSON.parse(response.body)
        category = category_json["trivia_categories"].find do |cat|
                        cat["name"] == "#{category}"
                   end 
        category_id = category["id"]
        return category_id
    end
end
