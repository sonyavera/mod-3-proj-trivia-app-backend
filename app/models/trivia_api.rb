require 'httparty'
require 'pp'
require 'json'

class TriviaApi

    # def self.create_categories
    #     response = HTTParty.get("https://opentdb.com/api_category.php")
    #     category_list = JSON.parse(response.body)
    #     category_arr = []
    #     category_list["trivia_categories"].each do |category|
    #         category_arr.push(category["name"])
    #     end
    # end

    def self.get_category_id(category)
        response = HTTParty.get("https://opentdb.com/api_category.php")
        category_json = JSON.parse(response.body)
        category = category_json["trivia_categories"].find do |cat|
                        cat["name"] == "#{category}"
                   end 
        category_id = category["id"]
        print category_id
    end

    # def self.new
    #     response = HTTParty.get("https://opentdb.com/api_category.php")
    #     category_list = JSON.parse(response.body)
    #     puts category_list
    #     render body: category_list
    # end

end

# # TriviaApi.create_categories
# # TriviaApi.create_quizzes
TriviaApi.get_category_id("Mythology")
# TriviaApi.generate_quiz("Mythology", "medium")

# TriviaApi.new