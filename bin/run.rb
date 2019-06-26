#!/usr/bin/env ruby

# I switched the order of the require_relative files to be chronological.
require_relative "../lib/api_communicator.rb"
require_relative "../lib/command_line_interface.rb"

welcome
character = get_character_from_user
show_character_movies(character)
