require "pry"

class BoardCase
      # c'est une case. Il devrait y avoir 9 instances de cette classe dans ta partie
      attr_accessor :how_is_status, :vertical, :horizontal

      def initialize(vertical_position, horizontal_position)
          @vertical      = vertical_position
          @horizontal    = horizontal_position
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



      def display_of_array_advanced
          puts "  0 1 2"
          puts "  _ _ _\n0|#{array_of_game[0][0].how_is_status}|#{array_of_game[0][1].how_is_status}|#{array_of_game[0][2].how_is_status}|"
          puts "  _ _ _\n1|#{array_of_game[1][0].how_is_status}|#{array_of_game[1][1].how_is_status}|#{array_of_game[1][2].how_is_status}|"
          puts "  _ _ _\n2|#{array_of_game[2][0].how_is_status}|#{array_of_game[2][1].how_is_status}|#{array_of_game[2][2].how_is_status}|"
          puts "  _ _ _"
      end


      def action(horizontal, vertical, joueur_tag)
          @array_of_game[horizontal][vertical].how_is_status = joueur_tag
      end

      def is_end(gagnant = "")
          res = 1
          signes = ["X", "O"]
          signes.each do |sign|
                gagnant = sign
                array_of_game[0].each { |b_case| if b_case.how_is_status == sign then res *= 1 else res *=0 end}; if res==1 then return true end; res==1
                array_of_game[1].each { |b_case| if b_case.how_is_status == sign then res *= 1 else res *=0 end}; if res==1 then return true end; res==1
                array_of_game[2].each { |b_case| if b_case.how_is_status == sign then res *= 1 else res *=0 end}; if res==1 then return true end; res==1
                #
                array_of_game.transpose[0].each { |b_case| if b_case == sign then res *= 1 else res *=0 end}; if res==1 then return true end; res==1
                array_of_game.transpose[1].each { |b_case| if b_case == sign then res *= 1 else res *=0 end}; if res==1 then return true end; res==1
                array_of_game.transpose[2].each { |b_case| if b_case == sign then res *= 1 else res *=0 end}; if res==1 then return true end; res==1
                #
                return true if (array_of_game[0][0].how_is_status + array_of_game[1][1].how_is_status + array_of_game[2][2].how_is_status) == sign+sign+sign
                return true if (array_of_game[0][2].how_is_status + array_of_game[1][1].how_is_status + array_of_game[2][0].how_is_status) == sign+sign+sign
          end
          gagnant = ""

        binding.pry
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



class Game
      # c'est la partie. Elle initialise tout et lance le jeu
      attr_accessor :gamer_one,   :gamer_two,   :tab_morpion,   :tour,   :sign_win

      def initialize
          @tab_morpion = [[]]
          @gamer_one = Player.new("Gamer_one","X")             #dans un 2nd temps demander la siigne et le nol du gamer
          @gamer_two = Player.new("Gamer_two","O")
          @tab_morpion = Board.new
          @tour = 0;
          @sign_win = ""
      end


      def go
          puts "Bienvenue"                                    #randam qui commence
          puts "joueur1 and sign"
          puts "joueur2 and sign"


          turn                           #gamer_first_tour premier joueur à jouer
      end


      def turn (gamer_tour = nil)
          if gamer_tour == nil then if tour % 2 == 0 then gamer_tour = gamer_one else gamer_tour = gamer_two end elsif gamer_tour == gamer_two then chg = gamer_two;  @gamer_two = gamer_one; @gamer_one =chg;   end
          @tour += 1
          tab_morpion.display_of_array_advanced
          puts "quel case vous jouer\nligne :"                        #personnaliser avec nom des joueur
          pos_v = gets.strip.to_i
          puts "coll :"                        #personnaliser avec nom des joueur
          pos_h = gets.strip.to_i


          gamer_tour.player_info
          tab_morpion.action(pos_v, pos_h, gamer_tour.player_tag.to_s)
          if tab_morpion.is_end(sign_win) then fin(sign_win) else self.turn end
      end

      def fin(sign_win)
          puts sign_win
          puts "messages de fin"                        #personnaliser avec nom des joueur
          tab_morpion.display_of_array_advanced
      end

end

puts Game.new.go
