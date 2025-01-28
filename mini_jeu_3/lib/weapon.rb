class Weapon
    attr_accessor :name, :damage
  
    def initialize
      @name = ["Epée", "Hache", "Arc", "Masse", "Dague"].sample
      @damage = rand(10..30) 
    end
  end
  