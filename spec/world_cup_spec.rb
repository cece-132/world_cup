require './lib/world_cup'

RSpec.describe WorldCup do

  before :each do
    @france = Team.new("France")
    @mbappe = Player.new({name: "Kylian Mbappe", position: "forward"})
    @pogba = Player.new({name: "Paul Pogba", position: "midfielder"})
    
    @france.add_player(@mbappe)
    @france.add_player(@pogba)

    @croatia = Team.new("Croatia")
    @modric = Player.new({name: "Luka Modric", position: "midfielder"}) 
    @vida = Player.new({name: "Domagoj Vida", position: "defender"})

    @croatia.add_player(@modric)
    @croatia.add_player(@vida)

    @world_cup = WorldCup.new(2018, [@france, @croatia])
  end

  describe 'initialize' do
    it 'exists and has attributes' do
      expect(@world_cup).to be_a WorldCup
      expect(@world_cup.year).to be_a Integer
      expect(@world_cup.year).to eq 2018
      expect(@world_cup.teams).to be_a Array
      expect(@world_cup.teams.include?(@croatia)).to eq true
      expect(@world_cup.teams.include?(@france)).to eq true
      expect(@world_cup.teams.length).to eq 2

      @world_cup.teams.each do |team|
        expect(team).to be_a Team
      end
    end
  end

  describe '#active_players_by_position(position)' do
    it 'can find all players by position where teams have not been eliminated' do
      expect(@world_cup.active_players_by_position("midfielder").length).to eq 2
      expect(@world_cup.active_players_by_position("midfielder").include?(@modric)).to eq true
      expect(@world_cup.active_players_by_position("midfielder").include?(@pogba)).to eq true
      expect(@world_cup.active_players_by_position("midfielder").include?(@mbappe)).to eq false
      expect(@world_cup.active_players_by_position("midfielder").include?(@vida)).to eq false
    end

    it 'wont show eliniated players' do
      @croatia.eliminated = true

      expect(@world_cup.active_players_by_position("midfielder").length).to eq 1
      expect(@world_cup.active_players_by_position("midfielder").include?(@modric)).to eq false
      expect(@world_cup.active_players_by_position("midfielder").include?(@pogba)).to eq true
      expect(@world_cup.active_players_by_position("midfielder").include?(@mbappe)).to eq false
      expect(@world_cup.active_players_by_position("midfielder").include?(@vida)).to eq false
    end
  end

  describe '#all_players_by_position' do
    it 'uses a hash to show all the players in the world cup sorted by position' do
      expect(@world_cup.all_players_by_position).to be_a Hash
      # expect(@world_cup.keys.include?("forward", "midfielder", "defender")).to eq true
      expect(@world_cup.all_players_by_position.keys.include?("forward")).to eq true
      expect(@world_cup.all_players_by_position.keys.include?("midfielder")).to eq true
      expect(@world_cup.all_players_by_position.keys.include?("defender")).to eq true

      expect(@world_cup.all_players_by_position["midfielder"].length).to eq 2
      expect(@world_cup.all_players_by_position["forward"].length).to eq 1
      expect(@world_cup.all_players_by_position["defender"].length).to eq 1

      expect(@world_cup.all_players_by_position.length).to eq 3
    end
  end

end