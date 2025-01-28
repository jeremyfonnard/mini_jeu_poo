class Game
    attr_accessor :human_player, :enemies, :players_left, :enemies_in_sight, :killed_ennemies
  
    def initialize(human_name)
      @human_player = HumanPlayer.new(human_name)
      @enemies = Array.new(4) { Player.new("joueur_#{rand(1000..9999)}") }
    end
  
    def kill_player(player)
      @enemies.delete(player)
    end
  
    def is_still_ongoing?
      @human_player.life_points > 0 && !@enemies.empty?
    end
  
    def show_players
      puts "Tu as #{@human_player.life_points} points de vie."
      puts "#{@enemies.length} adversaire(s) restant(s)."
    end
  
    def menu
      puts "Quelle action veux-tu effectuer ?"
      puts "a - chercher une meilleure arme"
      puts "s - chercher à se soigner"
      @enemies.each_with_index do |enemy, index|
        puts "#{index} - #{enemy.name} a #{enemy.life_points} points de vie"
      end
    end
  
    def menu_choice(choice)
      case choice
      when "a"
        @human_player.search_weapon
      when "s"
        @human_player.search_health_pack
      when "0"
        @human_player.attacks(@enemies[0]) if @enemies[0].life_points > 0
      when "1"
        @human_player.attacks(@enemies[1]) if @enemies[1].life_points > 0
      end
  
      @enemies.each { |enemy| kill_player(enemy) if enemy.life_points <= 0 }
    end
  
    def enemies_attack
      @enemies.each do |enemy|
        enemy.attacks(@human_player) if enemy.life_points > 0
      end
    end
  
    def end_game
      if @human_player.life_points > 0
        puts "BRAVO ! TU AS GAGNE !"
      else
        puts "Loser ! Tu as perdu !"
      end
    end
  end
  