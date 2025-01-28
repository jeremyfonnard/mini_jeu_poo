require 'bundler'
Bundler.require

require_relative 'game'
require_relative 'player'
require_relative 'human_player'
require_relative 'weapon'


puts "------------------------------------------------"
puts "|Bienvenue sur 'ILS VEULENT TOUS MA POO' !      |"
puts "|Le but du jeu est d'être le dernier survivant !|"
puts "-------------------------------------------------"

puts "Quel est ton nom ?"
user_name = gets.chomp
my_game = Game.new(user_name)

while my_game.is_still_ongoing?
my_game.new_players_in_sight
my_game.show_players
my_game.menu
print "fais ton choix : "
choice = gets.chomp
my_game.menu_choice(choice)
my_game.enemies_attack
my_game.add_enemies
end

my_game.end