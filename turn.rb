class Turn

  attr_reader :current_player, :ennemy_player, :round

  def initialize(players)
    @players = players.shuffle
    @current_player = nil
    @ennemy_player = nil
    @round = 0
  end

  def next_turn
    @round += 1
    @players.rotate!
    @current_player = get_current_player
    @ennemy_player = get_ennemy_player(@current_player)
  end

  def get_current_player
    @players.select{|player| !player.is_dead?}.first
  end

  def get_ennemy_player(current)
    @players.select{|player| player != current && !player.is_dead?}.sample
  end
end