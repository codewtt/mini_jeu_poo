require 'pry'
#create a class "player"
class Player 

    attr_accessor :name, :life_points # with 'attr_accesor' i can read and write => :name & :life_points
    
    def initialize (name)       # Execute un code à la création d'une instance.
        @name = name            # Methode => initialize
        @life_points = 10
    end

    def show_state              # Affiche l'état de santé de mon player => puts "#{@name} #{@life_points}"
        puts "#{@name} has #{@life_points} HP remaining"
    end

    def gets_damage (damage_received)  # Ici, méthode 'damage_received'  
        #@life_points = @life_points - damage_received.to_i # => soustraction des PDV - les dmgs reçu.to_i
        if @life_points <= 0                               # Si le joueur est inférieur ou égal à zéro il est mort
            puts "#{@name} is dead"   
        else  
            @life_points = @life_points - damage_received.to_i           
        end 
    end

    def attacks (target)
        puts "#{@name} attack #{target.name}"
        attack_roll = compute_damage         
        target.life_points = target.life_points - attack_roll
        puts "The attack caused #{@attack_roll} damages"
    end


    def compute_damage   # Ici, on def le jet d'attaque => attack_roll <= range de 1 à 6 points de dégats
        return rand(1..6)
    end
end

