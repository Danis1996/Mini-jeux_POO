require 'bundler'
Bundler.require

require_relative 'lib/game'
require_relative 'lib/player'

puts "------------------------------------------------
|Bienvenue sur 'ILS VEULENT TOUS MA POO' !      |
|Le but du jeu est d'être le dernier survivant !|
-------------------------------------------------"
puts "Entrez votre nom"
print ">"
humanplayer_name = gets.chomp
my_game = Game.new(humanplayer_name)
puts "Bienvenue >>> #{humanplayer_name} <<<"
puts "**************************************************"
puts "***L**E****J**E**U**X****C**O**M**M**E**N**C**E***"
puts "**************************************************"


while my_game.is_still_ongoing? == true do

  my_game.show_players
  my_game.menu
  command = gets.chomp
  my_game.menu_choice(command)
  my_game.enemies_attack
  my_game.kill_player
end
  my_game.ending if my_game.is_still_ongoing? == false