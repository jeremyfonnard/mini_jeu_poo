require 'bundler'
Bundler.require

require_relative 'lib/game'
require_relative 'lib/player'

binding.pry

# Initialisation des joueurs
player1 = Player.new("Jeremy")
player2 = Player.new("Jade")

# Boucle de combat
while player1.life_points > 0 && player2.life_points > 0
  puts "\nVoici l'état de nos joueurs :"
  player1.show_state
  player2.show_state

  puts "\nPassons à la phase d'attaque :"
  player1.attacks(player2)
  break if player2.life_points <= 0 # Sortie si player2 est mort

  player2.attacks(player1)
end

puts "\nLe combat est terminé !"
