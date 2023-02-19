require 'pry'
class WorldCup
  attr_reader :year, :teams

  def initialize(year, teams)
    @year = year
    @teams = [teams].flatten
  end

  def active_players_by_position(position)
    active = []
    @teams.each do |team|
      if !team.eliminated?
        team.players.each do |player|
          active << player if player.position.downcase == position.downcase
        end
      end
    end
    active
  end

  def all_players_by_position
    hash = {}
    @teams.each do |team|
      team.players.each do |player|
        if !hash["#{player.position}"].nil?
          hash["#{player.position}"] << player
        else
          hash["#{player.position}"] = [player]
        end
      end
    end
    hash
  end

end