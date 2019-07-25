class Game
  attr_accessor :humanplayer, :ennemies

  def initialize (humanplayer)
    @humanplayer = HumanPlayer.new("#{humanplayer}")
    @player_1 = Player.new("Josiane")  
    @player_2 = Player.new("José")
    @player_3 = Player.new("Jocelin")  
    @player_4 = Player.new("Joël")
    @players_left = 10
    @enemies_in_sight = []
    @ennemies = [@player_1, @player_2, @player_3, @player_4]
  end

#pour éliminer les énemie mort dans la liste des énemis:
  def kill_player
    @ennemies.each {|player| 
      if player.life_points <= 0
        @ennemies.delete(player)
        puts "#{player.name} est mort"
      end
    }
    puts " -+-+-+-+-+-+-+-+-+- "
  end

#Pour savoir si le jeux n'est pas encore terminé, c.a.d le joueur humain possède encore des points de vie et il reste des énemie dans la liste:
  def is_still_ongoing?
    if @humanplayer.life_points > 0 && (@player_1.life_points > 0 || @player_2.life_points > 0 || @player_3.life_points > 0 || @player_4.life_points > 0)
      return true
    else
      return false
    end
  end

#Pour afficher l'état du joueur humain et le nombre d'énemie restant:
  def show_players
    puts "++++++++++++++ETAT ACTUEL++++++++++++++++"
    puts "#{@humanplayer.show_state}"
    puts "2) Il reste encore #{@ennemies.size} ennemis à combatre"
    puts " -+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+"
    puts " "
  end

# Pour choisir l'action à faire:
  def menu
    puts "Que voulez-vous faire : \n A = Attaquer vos énemies \n X = Améliorer votre arme, \n V = Se soigner"
    print "Votre choix (A/B/X/V) ===>"
  end

#Pour executer le choix du jouer humain 
  def menu_choice(command)
    puts " -+-+-+-+-+-+-+-+-+- "
    if command == "X"
      @humanplayer.search_weapon
        elsif command == "V"
      @humanplayer.search_health_pack
        elsif command == "A" 
        puts "Choisiser votre cible: "
          for last_ennemies_number in (0...@ennemies.size)
            puts "soit >> #{last_ennemies_number} <<"
          end
        puts "pour attaquer respectivement :"
          @ennemies.each do
            |player| 
              puts "soit >> #{player.name} << qui a #{player.life_points} points de vie."
            end
            print "Votre choix ? ===> "
        command2 = gets.chomp
          if command2 == "0"
            @humanplayer.attacks(@player_1)
          elsif command2 == "1"
            @humanplayer.attacks(@player_2)
          elsif command2 == "2"
            @humanplayer.attacks(@player_3)
          elsif command2 == "3"
          @humanplayer.attacks(@player_4)
          end
    end
  end
#pour que les énemies attaques le joueur humain
  def enemies_attack 
    puts "Les autres joueurs attaquent !"
      @ennemies.each { 
      |player| player.attacks(@humanplayer)
        }
  end

#Affage du fin du jeux, résultat et remerciement
  def ending
    puts "**********************************"
    puts "***>>>>> La partie est finie <<<<<***"
      if humanplayer.life_points > 0
        puts "---------------------------------"
        puts "------BRAVO VOUS AVEZ GAGNE------"
        puts "--Merci pour votre participation-"
        puts "---------------------------------"
      else
        puts "---------------------------------"
        puts "---------------------------------"
        puts "----Domage! Vous avez perdu !----"
        puts "---------------------------------"
        puts "---------------------------------"
      end
    puts "****************************************"
    puts "*********A***N***K***O***A***Y**********"
    puts "*******m***i***l***O***m***a***y********"
    puts "****************************************"
  end
end