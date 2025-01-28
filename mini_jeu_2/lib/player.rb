class HumanPlayer < Player
    attr_accessor :weapon_level
  
    def initialize(name)
      super(name) 
      @life_points = 100
      @weapon_level = 1
    end
  
    def show_state
      puts "#{@name} a #{@life_points} points de vie et une arme de niveau #{@weapon_level}"
    end
  
    def compute_damage
      rand(1..6) * @weapon_level
    end
  
    def search_weapon
      new_weapon_level = rand(1..6)
      puts "Tu as trouvé une arme de niveau #{new_weapon_level}"
      if new_weapon_level > @weapon_level
        @weapon_level = new_weapon_level
        puts "Youhou ! Elle est meilleure que ton arme actuelle : tu la prends."
      else
        puts "Fuck elle n'est pas mieux que ton arme actuelle..."
      end
    end
  
    def search_health_pack
      dice = rand(1..6)
      if dice == 1
        puts "Tu n'as rien trouvé..."
      elsif dice.between?(2, 5)
        @life_points += 50
        @life_points = 100 if @life_points > 100
        puts "Bravo, tu as trouvé un pack de +50 points de vie !"
      elsif dice == 6
        @life_points += 80
        @life_points = 100 if @life_points > 100
        puts "Waow, tu as trouvé un pack de +80 points de vie !"
      end
    end
  end
  