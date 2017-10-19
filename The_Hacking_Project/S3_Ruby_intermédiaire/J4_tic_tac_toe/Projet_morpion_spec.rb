require 'pry'
# require 'spec_helper'
require 'Projet_tic-tac-toe_P2S3'

describe BoardCase do
  describe "#how_is_status" do
    it "initialize is good" do
      case1 = BoardCase.new(0,0)
      expect( case1.how_is_status ).to eq ""
    end
  end

  describe "#vertical" do
    it "vertical is good" do
      case1 = BoardCase.new(0,0)
      expect( case1.vertical ).to eq 0
    end
  end

  describe "#horizontal" do
    it "horizontal is good" do
      case1 = BoardCase.new(0,0)
      expect( case1.horizontal).to eq 0
    end
  end
end



describe Board do
  describe "#array_of_games" do
    it "array is good" do
      case1 = Board.new
      expect( case1.array_of_game[1][1].how_is_status ).to eq ""
    end
  end

  describe "#action" do
    it "action is good" do
      case1 = Board.new
      expect( case1.action(1,1,"X") ).to eq "X"
    end
  end

  # describe "#is_end" do
  #   it "horizontal is good" do
  #     case1 = BoardCase.new(0,0)
  #     expect( case1.is_end).to eq 0
  #   end
  # end
end


describe Player do
  describe "#name_of_player" do
    it "name is good" do
      case1 = Board.new
      expect( case1.array_of_game[1][1].how_is_status ).to eq ""
    end
  end


  describe "#player_status" do
    it "status is good" do
      case1 = Board.new("game1", "", "X")
      expect( case1.player_status ).to eq "In game"
    end
  end


  describe "#player_tag" do
    it "sign is good" do
      case1 = Board.new("game1", "", "X")
      expect( case1.player_tag ).to eq "X"
    end
  end
end




describe Game do
  describe "#gamer_one" do
    it "players is good" do
      case1 = Game.new
      expect( case1.gamer_one.name_of_player ).to eq "Gamer_one"
    end
  end
end
