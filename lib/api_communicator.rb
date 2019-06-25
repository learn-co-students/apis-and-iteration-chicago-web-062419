require "rest-client"
require "json"
require "pry"

def get_character_movies_from_api(character_name)
  #make the web request
  title_array = []
  response_string = RestClient.get("http://www.swapi.co/api/people/?search=#{character_name}")
  response_hash = JSON.parse(response_string)
  film_array = response_hash["results"][0]["films"]
  film_array.each do |site|
    site_string = RestClient.get(site)
    site_hash = JSON.parse(site_string)
    # end
    # binding.pry
    # return site_hash
    title_array << site_hash["title"]
    # site_hash["title"]
  end
  title_array
end

# iterate over the response hash to find the collection of `films` for the given
#   `character`
# collect those film API urls, make a web request to each URL to get the info
#  for that film
# return value of this method should be collection of info about each film.
#  i.e. an array of hashes in which each hash reps a given film
# this collection will be the argument given to `print_movies`
#  and that method will do some nice presentation stuff like puts out a list
#  of movies by title. Have a play around with the puts with other info about a given film.

# p get_character_movies_from_api("Luke Skywalker")

# film_list = get_character_movies_from_api(name)

def print_movies(films)
  # some iteration magic and puts out the movies in a nice list
  film_index_array = []
  films.each_with_index do |title, index|
    film_index_array << "#{index + 1}. #{title}"
  end
  # print_movies
  film_index_array
end

def show_character_movies(character)
  films = get_character_movies_from_api(character)
  print_movies(films)
end

# show_character_movies("Ben Kenobi")

## BONUS

that `get_character_movies_from_api` method is probably pretty long. Does it do more than one job?
can you split it up into helper methods?
