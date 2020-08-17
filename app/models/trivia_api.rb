require 'httparty'
require 'pp'
require 'json'


class TriviaApi

    def self.get_categories
        response = HTTParty.get("https://opentdb.com/api_category.php")
        test = JSON.parse(response.body)
        puts test
    end

    
end

TriviaApi.get_categories