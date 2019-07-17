require 'rest-client'
require 'json'
require 'pry'

def get_character_movies_from_api(character_name)
  response_string = RestClient.get('https://swapi.co/api/people/')
  response_hash = JSON.parse(response_string)

  movies = []
  movie_info = []

  response_hash["results"].each do |key|
    if key["name"] == character_name
      movies = key["films"]
    end
  end

  movies.each_index do |each_link|
    movie_info << JSON.parse(RestClient.get(movies[each_link]))
  end
movie_info
end

def print_movies(films)
    films.each do |film_info|
    p film_info["title"]
  end
end

def show_character_movies(character)
  films = get_character_movies_from_api(character)
  print_movies(films)
end
