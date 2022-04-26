require 'bundler'
require 'pry'
Bundler.require

require_relative 'lib/game'
require_relative 'lib/player'

#create new players 
player1 = Player.new ("Sacha")
player2 = Player.new ("Régis")

    puts "Let the fight begin !"
    puts "In the right corner from the Bourg-Palette => #{player1.name}"
    puts "In the left corner the bastard => #{player2.name}"

    puts "Game loading... Please be patient!"

    puts "=> Current players HP <="
    player1.show_state
    player2.show_state

    puts "FIGHT ! (ง'̀-'́)ง "
    while player1.life_points > 0 || player2.life_points > 0 do
        player1.attacks(player2)
        if player2.life_points <= 0
          break
        end
        player2.attacks(player1)
        if player1.life_points <= 0
          break
        end

    puts "Fight in progress"
    player1.show_state
    player2.show_state

    puts" "
  end

  puts "HP remaining for both player"
  player1.show_state
  player2.show_state
    if player1.life_points <= 0 
      puts "#{player1.name} is dead and go sleep"
    else
      puts "#{player2.name} régis is dead this bastard"
    end
    

    

    

    

    


=begin
À ma droite "Josiane" : crée un Player répondant à ce doux prénom et stocké dans la variable player1.
À ma gauche "José" : crée un autre Player répondant à ce joli prénom et stocké dans la variable player2.
Présentons les deux combattants : affiche dans le terminal l'état de chaque combattant grâce à des puts 
et des show_state. Juste avant, affiche un petit puts "Voici l'état de chaque joueur :".
Fight ! Indique que le combat commence avec un puts "Passons à la phase d'attaque :".
Josiane aura l'honneur d'attaquer la première : fais attaquer player2 par player1 avec la méthode attacks.
José ne va pas se laisser faire : fais l'attaque inverse.
=end










binding.pry