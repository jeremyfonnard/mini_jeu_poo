class Game
attr_accessor :human_player, :enemies, :players_left, :enemies_in_sight

def initialize(human_name)
    @human_player = HumanPlayer.new(human_name)
    @enemies_in_sight = []
    @players_left = 10
end
  
    def kill_player(player)
    @enemies_in_sight.delete(player)
    end

    def is_still_ongoing?
    @human_player.life_points > 0 && !(@enemies_in_sight.empty? && @players_left == 0)
    end

    def show_players
    puts "Tu as #{@human_player.life_points} points de vie."
    puts "Il reste #{@players_left} ennemis à combattre et #{@enemies_in_sight.length} en vue."
    end

    def new_players_in_sight
    if @players_left == 0
        puts "Tous les joueurs sont déjà en vue"
        return
    elsif @enemies_in_sight.length == @players_left
        puts "Tous les joueurs sont déjà en vue"
        return
    end

    dice = rand(1..6)
    if dice == 1
        puts "Aucun nouvel adversaire n'arrive"
    elsif dice >= 2 && dice <= 4
        if @players_left > 0
        @enemies_in_sight << Player.new("joueur_#{rand(1000..9999)}")
        @players_left -= 1
        puts "Un nouvel adversaire arrive en vue !"
        end
    else
        if @players_left >= 2
        2.times do
            @enemies_in_sight << Player.new("joueur_#{rand(1000..9999)}")
            @players_left -= 1
        end
        puts "Deux nouveaux adversaires arrivent en vue !"
        elsif @players_left == 1
        @enemies_in_sight << Player.new("joueur_#{rand(1000..9999)}")
        @players_left -= 1
        puts "Un nouvel adversaire arrive en vue !"
        end
    end
    end
  
    def menu
    puts "Quelle action veux-tu effectuer ?"
    puts "a - chercher une meilleure arme"
    puts "s - chercher à se soigner"
    puts "attaquer un joueur en vue :"
    @enemies_in_sight.each_with_index do |enemy, index|
        puts "#{index} - #{enemy.name} a #{enemy.life_points} points de vie"
    end
    end
  
    def menu_choice(choice)
    case choice
    when "a"
        @human_player.search_weapon
    when "s"
        @human_player.search_health_pack
    else
        if choice.to_i.between?(0, @enemies_in_sight.length - 1)
        @human_player.attacks(@enemies_in_sight[choice.to_i])
        end
    end

    @enemies_in_sight.each { |enemy| kill_player(enemy) if enemy.life_points <= 0 }
    end
  
    def enemies_attack
    puts "\nLes ennemis t'attaquent !"
    @enemies_in_sight.each do |enemy|
        if enemy.life_points > 0
        enemy.attacks(@human_player)
        end
    end
    end
  
    def end_game
    puts "La partie est finie"
    if @human_player.life_points > 0
        puts "BRAVO ! TU AS GAGNE !"
    else
        puts "Loser ! Tu as perdu !"
    end
    end
    end
