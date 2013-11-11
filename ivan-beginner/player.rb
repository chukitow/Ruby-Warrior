
class Player
    def initialize
        @health = 20
    end
    def fueAtacado?
        opcion = false
        if @warrior.health < 20
            opcion= true
        end
        opcion
    end
    
    def enemigosCera(direccion)
        @espacios = @warrior.look(direccion)
        enemigos = Array.new
        @espacios.each do |space|
            enemigos.push(space.character)
        end
        if enemigos.include?('a') || enemigos.include?('w') || enemigos.include?('S')
            enemigosT=true
            else
            enemigosT=false
        end
        enemigosT
    end
    
    def decidirMovimientos!
            if enemigosCera(:backward) && enemigosCera(:forward)
            @warrior.walk!
            elsif enemigosCera(:forward) && !enemigosCera(:backward)
            @warrior.shoot!
            elsif !enemigosCera(:backward) && !enemigosCera(:forward)
            @warrior.rest!
            elsif @warrior.feel.wall?
            @warrior.pivot!
            elsif @warrior.health <= 5
            @warrior.walk!(:backward)
        end
    end
    
    def play_turn(warrior)
        @warrior = warrior
        if @warrior.feel.empty?
            if fueAtacado?
                decidirMovimientos!
                else
                 @warrior.walk!
            end
            else
            if @warrior.feel.enemy?
                @warrior.attack!
                elsif @warrior.feel.captive?
                @warrior.rescue!
                elsif @warrior.feel.wall?
                @warrior.pivot!
            end
        end
        
        @health = @warrior.health
    end
end