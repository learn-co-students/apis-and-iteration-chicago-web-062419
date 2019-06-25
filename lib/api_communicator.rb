require 'rest-client'
require 'json'
require 'pry'

def get_character_movies_from_api(character_name)
  title_array = []
  response_string = RestClient.get("http://www.swapi.co/api/people/?search=#{character_name}")
  response_hash = JSON.parse(response_string)
  film_array = response_hash["results"][0]["films"]
  film_array.each do |site|
    site_string = RestClient.get(site)
    site_hash = JSON.parse(site_string)
    title_array << site_hash["title"]
  end
    title_array
  end

def print_movies(films)
  film_index_array = []
  films.each_with_index do |title, index|
    film_index_array << "#{index + 1}. #{title}"
end
film_index_array
end



def show_character_movies(character)
  films = get_character_movies_from_api(character)
  print_movies(films)
end
