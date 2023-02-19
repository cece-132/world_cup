require './lib/team'

RSpec.describe Team do
  describe 'initialize' do
    it 'exists and has attributes' do
      team = Team.new("France") 

      expect(team).to be_a Team
      expect(team.country).to eq 'France'
      expect(team.eliminated?).to eq false
      expect(team.eliminated = true).to eq true
      expect(team.players).to be_a Array
      expect(team.players).to be_empty
    end
  end

  describe '#add_player(player)' do
    it 'can add players to a team' do
      team = Team.new("France") 

      mbappe = Player.new({name: "Kylian Mbappe", position: "forward"})
      pogba = Player.new({name: "Paul Pogba", position: "midfielder"})

      expect(team.players).to be_empty
      
      team.add_player(mbappe)

      expect(team.players.length).to eq 1
      expect(team.players.include?(mbappe)).to eq true

      team.add_player(pogba)

      expect(team.players.length).to eq 2
      expect(team.players.include?(pogba)).to eq true
    end
  end

  describe '#players_by_position(position)' do
    it 'should sort players by inputted position' do
      team = Team.new("France") 

      mbappe = Player.new({name: "Kylian Mbappe", position: "forward"})
      pogba = Player.new({name: "Paul Pogba", position: "midfielder"})

      team.add_player(mbappe)
      team.add_player(pogba)

      expect(team.players_by_position("midfielder").include?(pogba)).to eq true
      expect(team.players_by_position("midfielder").include?(mbappe)).to eq false

      expect(team.players_by_position("defender")).to be_a Array
      expect(team.players_by_position("defender")).to be_empty
    end
  end

end