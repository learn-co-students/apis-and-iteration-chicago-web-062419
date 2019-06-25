require 'rest-client'
require 'json'
require 'pry'


def get_character_movies_from_api(character_name)
  #make the web request
  response_string = RestClient.get('http://www.swapi.co/api/people/')
  response_hash = JSON.parse(response_string)
   # iterate over the response hash to find the collection of `films` for the given
  #   `character`
  movie_url_array = []
  response_hash["results"].each do |character|
    if character["name"].downcase == character_name.downcase
      movie_url_array << character["films"]
    end
  end
  movie_url_array = movie_url_array.flatten
  movie_url_array
  # collect those film API urls, make a web request to each URL to get the info
  #  for that film
  # return value of this method should be collection of info about each film.
  #  i.e. an array of hashes in which each hash reps a given film
  # this collection will be the argument given to `print_movies`
  #  and that method will do some nice presentation stuff like puts out a list
  #  of movies by title. Have a play around with the puts with other info about a given film.
  
end


def gets_movie_hasharray(character_name)
  characterfilms = []
  movie_url_array = get_character_movies_from_api(character_name)
  movie_url_array.each do |filmurl|
    filminfo = RestClient.get(filmurl)
    parsedfilminfo = JSON.parse(filminfo)
    characterfilms << parsedfilminfo
  end
  characterfilms
  
end

def print_movies(character)
  # some iteration magic and puts out the movies in a nice list
 
  filmsofcharacter = gets_movie_hasharray(character)

  filmsofcharacter.each do |film|
    puts film["title"]
  end
  nil
  
end

def show_character_movies(character)
  print_movies(character)
end

## BONUS

# that `get_character_movies_from_api` method is probably pretty long. Does it do more than one job?
# can you split it up into helper methods?
