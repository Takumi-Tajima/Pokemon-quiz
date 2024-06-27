require 'csv'

def load_pokemon_from_csv(file_path)
  pokemon_data = []
  CSV.foreach(file_path, headers: true).each_with_index do |row, _i|
    pokemon_data << row.to_hash
    break if _i == 150
  end
  pokemon_data
end

def main
  file_path = 'pokemon.csv'
  pokemon_data = load_pokemon_from_csv(file_path)

  random_pokemon = pokemon_data.sample
  rand

  puts "#{random_pokemon['name']}は日本語では何と呼ばれますか？"
  japanese_name_input = gets.chomp.downcase

  correct_japanese_name = random_pokemon['japanese_name'].downcase.gsub(/[a-z]/, '')

  if japanese_name_input.include?(correct_japanese_name)
    puts '正解！'
  else
    puts "残念！正解は#{random_pokemon['japanese_name']}でした！"
  end
rescue StandardError => e
  puts "エラー: #{e.message}"
end

main
