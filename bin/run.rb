#!/usr/bin/env ruby

require_relative "../lib/api_communicator.rb"
require_relative "../lib/command_line_interface.rb"
require_relative "../lib/bonus.rb"

# welcome
# character = get_character_from_user
# show_character_movies(character)

welcome
character = get_character_from_user
api_string = get_string_from_api(character)
character_hash = parse_into_hash(api_string)
film_array = create_film_array(character_hash)
title_array = create_title_array(film_array)
movie_list = print_movies(title_array)
p show_character_movies(movie_list)

# api_string_array = iterate_film_array(film_array)
# array_of_film_hash = create_film_hash(api_string_array)
# create_title_array(array_of_film_hash)