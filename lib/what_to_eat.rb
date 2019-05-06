require 'net/http'
require 'uri'

#1. Bundle the gem:
#  bundle gem what_should_i_eat --bin

#1b. define API keys

app_id = "26b201e9"
app_key = "953e8d1f4d0fc6273d5471007e30f8f6"


#2. make an HTTP GET request
# result = Net::HTTP.get('www.edamam.com','/search?type=Feeds')
# puts result





uri = URI.parse("https://api.edamam.com/search?q=vegetarian&app_id=#{app_id}&app_key=#{app_key}&from=0&to=3&calories=591-722&health=alcohol-free")
response = Net::HTTP.get_response(uri)
puts response

#puts response.code
#puts response.body

#3. Parse the returned text as JSON and save it into a variable
require 'json'
#TRAINING
#hash = { ruby: "programming language" }
#json = hash.to_json
#puts json

#json_course = "{\"course\":\"104\"}"
#puts json_course
#hash_course = JSON.parse(json_course)
#puts hash_course

# translate the json into a ruby hash (python: = dictionary)
#recipes = JSON.parse(result)
#puts recipes
recipes = JSON.parse(response.body)
#puts recipes

#4. Pick out a recipe from the variable
#puts recipes.class # Hash
#puts recipes.keys # q, from, to, params
#puts recipes['hits'].class # array
#puts recipes['hits'].size
#puts recipes['hits'].first.class # Hash
#puts recipes['hits'].first.keys
#puts recipes['hits'].first['recipe'].keys #hash

name = recipes['hits'].first['recipe']['label']
url = recipes['hits'].first['recipe']['url']
#puts recipes.size # 7
#puts recipes.first.class # array


#5. Print that recipe to the screen
puts recipes['hits'].first['recipe']['label']
puts recipes['hits'].first['recipe']['url']
puts recipes['hits'].last['recipe']['label']
puts recipes['hits'].last['recipe']['url']