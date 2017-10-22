require "pry"

class BoardCase
      # c'est une case. Il devrait y avoir 9 instances de cette classe dans ta partie
      attr_accessor :how_is_status, :vertical, :horizontal

      def initialize(vertical_position, horizontal_position)

          @how_is_status = " "
      end
end




class Board
      # c'est le plateau. Il doit y avoir une instance de cette classe lors d'une partie.
      attr_accessor :array_of_game

      def initialize
          @array_of_game = [[],[],[]]
          @array_of_game[0][0] = BoardCase.new(0,0)
          @array_of_game[0][1] = BoardCase.new(0,1)
          @array_of_game[0][2] = BoardCase.new(0,2)
          @array_of_game[1][0] = BoardCase.new(1,0)
          @array_of_game[1][1] = BoardCase.new(1,1)
          @array_of_game[1][2] = BoardCase.new(1,2)
          @array_of_game[2][0] = BoardCase.new(2,0)
          @array_of_game[2][1] = BoardCase.new(2,1)
          @array_of_game[2][2] = BoardCase.new(2,2)
      end



      def display_of_array_advanced                                               #permet l'affichage du plateau de jeu
          puts "  0 1 2 ".rjust(100)
          puts "  _ _ _ ".rjust(100)
          puts "0|#{array_of_game[0][0].how_is_status}|#{array_of_game[0][1].how_is_status}|#{array_of_game[0][2].how_is_status}|".rjust(100)
          puts "  _ _ _ ".rjust(100)
          puts "1|#{array_of_game[1][0].how_is_status}|#{array_of_game[1][1].how_is_status}|#{array_of_game[1][2].how_is_status}|".rjust(100)
          puts "  _ _ _ ".rjust(100)
          puts "2|#{array_of_game[2][0].how_is_status}|#{array_of_game[2][1].how_is_status}|#{array_of_game[2][2].how_is_status}|".rjust(100)
          puts "  _ _ _ ".rjust(100)
      end


      def action(horizontal, vertical, joueur_tag)                                #permet de cocher une case
          @array_of_game[horizontal][vertical].how_is_status = joueur_tag
      end

      def is_end(the_player)                                                      # les régle de jeu pour gagner la manche
          res = 1
          signes = ["X", "O"]
          the_player.player_status = "win"
          signes.each do |sign|
                # the_player.player_status = "win" if the_player.player_tag == sign
                array_of_game[0].each { |b_case| if b_case.how_is_status == sign then res *= 1 else res *=0 end}; if res==1 then return true end; res=1 ;
                array_of_game[1].each { |b_case| if b_case.how_is_status == sign then res *= 1 else res *=0 end}; if res==1 then return true else res=1 end;
                array_of_game[2].each { |b_case| if b_case.how_is_status == sign then res *= 1 else res *=0 end}; if res==1 then return true else res=1 end;
                #
                array_of_game.transpose[0].each { |b_case| if b_case.how_is_status == sign then res *= 1 else res *=0 end}; if res==1 then return true end; res=1
                array_of_game.transpose[1].each { |b_case| if b_case.how_is_status == sign then res *= 1 else res *=0 end}; if res==1 then return true end; res=1
                array_of_game.transpose[2].each { |b_case| if b_case.how_is_status == sign then res *= 1 else res *=0 end}; if res==1 then return true end; res=1
                #
                return true if (array_of_game[0][0].how_is_status + array_of_game[1][1].how_is_status + array_of_game[2][2].how_is_status) == sign+sign+sign
                return true if (array_of_game[0][2].how_is_status + array_of_game[1][1].how_is_status + array_of_game[2][0].how_is_status) == sign+sign+sign
          end
        # binding.pry
        the_player.player_status = "In game"
        return false
      end
end






class Player
      # ce sont les joueurs. Il doit y avoir 2 instances de cette classe lors d'une partie
      attr_accessor :name_of_player,  :player_status,   :player_tag

      def initialize(the_name, the_sign)
          @name_of_player = the_name
          @player_status  = "In game"
          @player_tag     = the_sign
      end

      def player_info
        puts name_of_player.to_s + "(" + player_tag.to_s + ") : " + player_status.to_s
      end

end



class Game  #demmare et finalise le jeu
      # c'est la partie. Elle initialise tout et lance le jeu
      attr_accessor :gamer_one,   :gamer_two,   :tab_morpion,   :tour,   :sign_win

      def initialize
          @tab_morpion = [[]]
          @gamer_one = Player.new("Gamer_one","X")     #dans un 2nd temps demander la siigne et le nol du gamer
          @gamer_two = Player.new("Gamer_two","O")
          @tab_morpion = Board.new
          @tour = 0;
          @sign_win = ""
      end


      def go                                        #lance le jeu affiche le message de bienvenue
          puts "Bienvenue il n'y aura pas de random c'est le joueur 1 qui commence"
          puts "Le nom du joueur 1 est Gamer_one, son signe est 'X'"
          puts "Le nom du joueur 2 est Gamer_two, son signe est 'O'"
          turn  (gamer_one)                         #gamer_first_tour premier joueur à jouer
      end


      def turn (gamer_tour = nil)                  # gère le changement de tour ainsi que le jeu
          if gamer_tour == nil then if tour % 2 == 0 then gamer_tour = gamer_one else gamer_tour = gamer_two end elsif gamer_tour == gamer_two then chg = gamer_two;  @gamer_two = gamer_one; @gamer_one =chg;   end
          @tour += 1
          tab_morpion.display_of_array_advanced
          gamer_tour.player_info

          puts "quel case vous jouer (ex:LC, 00, 01, 02, 10, 11, 12...22,)\nLigne : Coll :"                        #personnaliser avec nom des joueur
          cell = gets.strip.to_s
          pos_v = cell[0].to_i
          pos_h = cell[1].to_i


          # tab_morpion.action(0, 0, gamer_tour.player_tag.to_s)
          # tab_morpion.action(0, 1, gamer_tour.player_tag.to_s)
          # tab_morpion.action(0, 2, gamer_tour.player_tag.to_s)

          tab_morpion.action(pos_v, pos_h, gamer_tour.player_tag.to_s)
          if tab_morpion.is_end(gamer_tour) then fin(gamer_tour) else self.turn end
      end

      def fin(winner) #fin de partie affiches les stats

          puts "\n\n\n"
          if gamer_one.player_status == "win" then  gamer_two.player_status = "loose"   else  gamer_one.player_status = "loose" end

          gamer_one.player_info
          gamer_two.player_info

          tab_morpion.display_of_array_advanced
      end

end

jeu = Game.new.go
