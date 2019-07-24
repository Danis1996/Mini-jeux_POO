require 'bundler'
Bundler.require

require_relative 'lib/game'
require_relative 'lib/player'

#À ma droite "Josiane" : 
player1 = Player.new("Josiane")
#À ma gauche "José" :
player2 = Player.new("José")

#combat à mort
while (player1.life_points || player2.life_points) > 0

puts "----------Voici l'état de chaque joueur :------------"
puts " "
puts player1.show_state
puts player2.show_state
#Indique que le combat commence
puts "********Passons à la phase d'attaque :**********"
puts " "

#Josiane aura l'honneur d'attaquer la première :
player1.attacks(player2)
#Arrêter le combat si José est mort
break if player2.life_points <= 0
#José ne va pas se laisser faire :
puts " "
player2.attacks(player1)
puts " "
end




binding.pry