class HumanPlayer
    attr_accessor :name, :life_points, :weapon
  
    def initialize(name)
      @name = name
      @life_points = 100  
      @weapon = Weapon.new 
    end
  
    def search_weapon
      new_weapon = Weapon.new
      puts "Tu as trouvé une nouvelle arme : #{new_weapon.name}."
      if new_weapon.damage > @weapon.damage
        @weapon = new_weapon
        puts "Tu remplaces ton ancienne arme par la nouvelle."
      else
        puts "Ta nouvelle arme est moins puissante, tu gardes ton ancienne arme."
      end
    end
  
    def search_health_pack
      health_pack = rand(1..6)
      case health_pack
      when 1
        puts "Désolé, tu n'as rien trouvé..."
      when 2..5
        @life_points += 20
        @life_points = 100 if @life_points > 100 # Limite les points de vie à 100
        puts "Tu as trouvé un pack de soin ! Tu as maintenant #{@life_points} points de vie."
      when 6
        @life_points += 50
        @life_points = 100 if @life_points > 100 # Limite les points de vie à 100
        puts "Bravo ! Tu as trouvé un pack de soins ! Tu es à #{@life_points} points de vie."
      end
    end
  
    def attacks(player)
      puts "#{@name} attaque #{player.name} avec son arme #{@weapon.name}."
      damage = @weapon.damage
      player.gets_damage(damage)
    end
  
    def gets_damage(damage)
      @life_points -= damage
      puts "#{@name} perd #{damage} points de vie. Il lui en reste #{@life_points}."
      if @life_points <= 0
        puts "#{@name} est mort !"
      end
    end
  end
  