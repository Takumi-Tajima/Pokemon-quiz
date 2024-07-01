# APIからとってきたデータ（151匹）をpokemon.rbに読み込ませる
# https://pokeapi.co/api/v2/pokemon?limit=151&offset=0
require 'net/http'
require 'uri'
require 'json'
require 'csv'

uri = URI.parse('https://pokeapi.co/api/v2/pokemon?limit=151&offset=0')
json = Net::HTTP.get(uri)
result = JSON.parse(json, symbolize_names: true)
pokemons = result[:results]

puts pokemons.class
