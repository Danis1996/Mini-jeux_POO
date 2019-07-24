class Player
    attr_accessor :name, :life_points

    def initialize(name)
        @name = name
        @life_points = 10
    end

    def show_state
        @state = @life_points
        puts "#{@name} a #{@state} points de vie"
    end
    
    def gets_damage(damage_received)
        @life_points = @life_points - @damage_received
        puts "le joueur #{@name} a été tué !" if @life_points <= 0
    end

    def attacks(player)
        puts "#{@name} attaque #{player.name}"
        @damage_number = player.compute_damage
        player.life_points -= @damage_number
        puts "il lui inflige #{@damage_number} points de dommages"
        puts "le joueur #{player.name} a été tué !" if player.life_points <= 0

    end

    def compute_damage
        return rand(1..6)
    end
end

