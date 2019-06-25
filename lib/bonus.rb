require 'rest-client'
require 'json'
require 'pry'

def get_string_from_api(character_name)
  RestClient.get("http://www.swapi.co/api/people/?search=#{character_name}")
end

def parse_into_hash(string)
    JSON.parse(string)
end

def create_film_array(hash)
    hash["results"][0]["films"]
end

def create_title_array(array)
    site_hash = {}
    title_array = []
    array.each do |site|
        site_string = RestClient.get(site)
        site_hash = JSON.parse(site_string)
        title_array << site_hash["title"]
    end
    title_array
end

# def create_film_hash(j_strings)
#     JSON.parse(j_strings)
# end

# def create_title_array(j_array)
#     title_array = []
#     j_array.each do |movie|
#         title_array << movie["title"]
#     end
#     title_array
# end





















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