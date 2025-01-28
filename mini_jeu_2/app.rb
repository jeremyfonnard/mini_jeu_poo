require 'bundler'
Bundler.require

require_relative 'lib/game'
require_relative 'lib/player'

puts "------------------------------------------------"
puts "| Bienvenue sur 'ILS VEULENT TOUS MA POO' !      |"
puts "| Le but du jeu est d'être le dernier survivant !|"
puts "-------------------------------------------------"

puts "Quel est ton prénom ?"
print "> "
player_name = gets.chomp
user = HumanPlayer.new(player_name)

player1 = Player.new("Jeremy")
player2 = Player.new("Jade")
enemies = [player1, player2]

while user.life_points > 0 && (player1.life_points > 0 || player2.life_points > 0)
  user.show_state

  puts "Quelle action veux-tu effectuer ?"
  puts "a - chercher une meilleure arme"
  puts "s - chercher à se soigner"
  puts "0 - attaquer un joueur en vue :"
  enemies.each_with_index do |enemy, index|
    if enemy.life_points > 0
      puts "#{index} - #{enemy.show_state}"
    end
  end

  print "> "
  choice = gets.chomp
  case choice
  when "a"
    user.search_weapon
  when "s"
    user.search_health_pack
  when "0", "1"
    target_index = choice.to_i
    if enemies[target_index] && enemies[target_index].life_points > 0
      user.attacks(enemies[target_index])
    else
      puts "Cette cible n'est pas valide."
    end
  else
    puts "Commande inconnue, choisis une action valide."
  end

  puts "Les autres joueurs t'attaquent !" if enemies.any? { |enemy| enemy.life_points > 0 }
  enemies.each do |enemy|
    enemy.attacks(user) if enemy.life_points > 0
  end
end

puts "La partie est finie."
if user.life_points > 0
  puts "BRAVO ! TU AS GAGNÉ !"
else
  puts "Loser ! Tu as perdu !"
end
