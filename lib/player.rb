class Player

  attr_reader :name, :position
  def initialize(data)
    @name = data[:name]
    @position = data[:position]
  end
end