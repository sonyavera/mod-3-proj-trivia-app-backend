require 'httparty'
require 'pp'
require 'json'

class QuizzesController < ApplicationController
    
    def new
        response = HTTParty.get("https://opentdb.com/api_category.php")
        category_list = JSON.parse(response.body)
        render json: category_list
    end

    def find 
        quiz = Quiz.create(quiz_params)
        quiz.category_id = Quiz.get_category_id(quiz.category)
        response = HTTParty.get("https://opentdb.com/api.php?amount=10&category=#{quiz.category_id}&difficulty=#{quiz.difficulty}&type=multiple")        
        questions_json = JSON.parse(response.body)["results"]   
        render json: questions_json
        #we need to write a custom setter that updates the quiz-result joiner table as well
    end

    
    private

    def quiz_params
        params.require(:quiz).permit(:category,:difficulty)
    end
end
