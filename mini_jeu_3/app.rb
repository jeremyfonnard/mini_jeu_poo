require 'bundler'
Bundler.require

require_relative 'lib/game'
require_relative 'lib/player'
require_relative 'lib/human_player'
require_relative 'lib/weapon'


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
end

my_game.end_game
