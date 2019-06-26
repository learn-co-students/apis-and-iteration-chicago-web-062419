require "rest-client"
require "JSON"

character_data = RestClient.get('http://swapi.co/api/people/1')
 
puts character_data

JSON.parse(character_data)

def welcome 
    