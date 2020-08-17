require 'httparty'
require 'pp'
require 'json'

class QuizzesController < ApplicationController
    
    def new
        # response = HTTParty.get("https://opentdb.com/api_category.php")
        # category_list = JSON.parse(response.body)
        # render body: category_list
        prints "test"
        testHash = {test: "test"}
        render json: testHash
        # render json: "{\"test\": \"test\"}"
        # render plain: "test"
        # render json: HTTParty.get("https://opentdb.com/api_category.php")
    end

    def create 
    # create quiz here
    # this will take the user's input and call the Trivia API to retrieve JSON
    # this method will (probably) redirect to the show path
        quiz = Quiz.create(quiz_params)
        quiz.category_id = Quiz.get_category_id(quiz.category)
        #we need to write a custom setter that updates the user-quiz joiner table as well
        response = HTTParty.get("https://opentdb.com/api.php?amount=10&category=#{quiz.category_id}&difficulty=#{quiz.difficulty}&type=multiple")        
        questions_json = JSON.parse(response.body)["results"]   

        render json: questions_json
    end
    
    def show
    #quiz is rendered here
     

    #render json: @quiz
    end

    private

    def quiz_params
        params.require(:quiz).permit(:category,:difficulty)
    end
end
