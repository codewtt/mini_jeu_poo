require 'pry'
class Game 
    attr_accessor :human_player, :enemies
  
    def initialize(human)
      @human_player = HumanPlayer.new(human)
      @enemies = [Player.new("René"), Player.new("Celine"), Player.new("Kaas"), Player.new("Jhonny")]
    end
  
    def kill_player(enemies_to_delete)
      @enemies.each_with_index do |bot|
      @enemies.delete_if(bot.life_points < 1)
      end
    
    end
  
    def is_still_ongoing?
      if @human_player.life_points > 0 && !@enemies.empty?
        return true
      else
        return false
      end
    end
  
    def show_players 
      @human_player.show_state
      puts "Remaining #{@enemies.count} ennemy to kill.\n\n"
    end
    
    def menu 
      puts "Choose your destiny !\n"
      puts "a => Select weapon\n"                                              # --> Affichage du menu d'action pour l'utilisateur
      puts "s => Heal for.\n\n"
      puts"=============================\n\n"
      puts "Attacks ennemies"
        enemies.each_with_index do |bot, index|                                              # --> affiche les choix d'attaque et l'état        
          if bot.life_points > 0                                                             # --> Boucle dans l'array ennemies
            puts "#{index} --> Attack #{bot.name} who as #{bot.life_points} HP"   # --> Passe sur chaque objet de l'array crée, pour mettre a jour points de vie
          else
            puts "#{index} --> ERROR! Can't attack #{bot.name}, is already sleep ! "
          end
        end
    end
  
      puts "\n\n"
  
    def menu_choice()
      puts "Make a decision #{@human_player.name} ? \n"
      print "--> "
      choice = gets.chomp                                                                      # --> choix du joueur
      puts "\n\n"
      puts "Fight still in progress : \n\n"
  
     
      if choice == "a"                                                                         # --> Boucle if pour diriger l'utilisateur selon sont choix
      @human_player.search_weapon                                                                # --> Appel de la méthode search_weapon crée dans player
          
      elsif choice == "s"
      @human_player.search_health_pack                                                           # --> Appel de la méthode search_health_pack crée dans player
  
  
      elsif choice == "0"  || choice == "1" || choice == "2" || choice == "3"  
      position = choice.to_i
        if position <= @enemies.count-1
          if @enemies[position].life_points > 0
            @human_player.attacks(enemies[position])
              
          end
        else 
          "NOOOOOOOP"
        end
      end         
    end
    
    def enemies_attack 
      puts "You'r getting in bad situation bra !"
      @enemies.each do |enemie|
        if enemie.life_points > 0 
          enemie.attacks(@human_player)
        end
      end
    end
  
    def end
    puts "GAME OVER"
  
      if @human_player.life_points > 0 && @enemies.each_with_index{|x, index| x.life_points < 1}
  
      puts "You got this fight G G"
      else
      puts "You lost go dodo"
      end
    end
  end