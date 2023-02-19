require 'pry'
class Team
  attr_reader :country, :players
  attr_accessor :eliminated

  def initialize(country, eliminated = false)
    @country = country
    @eliminated = eliminated
    @players = []
  end

  def eliminated?
    @eliminated
  end

  def add_player(player)
    @players << player
  end

  def players_by_position(position)
   @players.map do |player| 
      player if player.position.downcase == position.downcase 
   end.compact
  end
end