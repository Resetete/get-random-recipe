require 'net/http'
require 'uri'

module WhatToEat
  def WhatToEat.fresh
    #1b. define API keys
    app_id = "" # enter your APP ID here
    app_key = "" # enter your API key here

    # Get User Input
    puts "What type of diet? (high-protein / balanced / low-fat / low-carb ) "
    diet = gets.chomp || ""

    puts "What type of cuisine?"
    cuisine = gets.chomp

    puts "Max calories?"
    max_cal = gets.to_s.chomp


    uri = URI.parse("https://api.edamam.com/search?q=vegetarian&app_id=#{app_id}&app_key=#{app_key}&from=0&to=3&calories=50-#{max_cal}&diet=#{diet}&cuisine=#{cuisine}")
    response = Net::HTTP.get_response(uri)

    #3. Parse the returned text as JSON and save it into a variable
    require 'json'

    recipes = JSON.parse(response.body)

    name = recipes['hits'].first['recipe']['label']
    url = recipes['hits'].first['recipe']['url']

    #5. Print that recipe to the screen
    puts recipes['hits'].first['recipe']['label']
    puts recipes['hits'].first['recipe']['url']
    puts recipes['hits'].last['recipe']['label']
    puts recipes['hits'].last['recipe']['url']
  end
end
