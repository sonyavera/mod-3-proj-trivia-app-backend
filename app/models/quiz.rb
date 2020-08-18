require 'httparty'
require 'json'

class Quiz < ApplicationRecord
     has_many :quiz_results
     has_many :users, through: :quiz_results

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
        print category_id
    end

    
end

Quiz.get_category_id("Mythology")



