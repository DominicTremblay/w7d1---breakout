require_relative './jedi'
require_relative './turn'

class Game

  attr_reader :jedis, :turn
  attr_accessor :round

  def initialize
    jedi1 = Jedi.new('Yoda    ', 'Light Side')
    jedi2 = Jedi.new('Vador   ', 'Dark Side')
    jedi3 = Jedi.new('Obiwan  ', 'Light Side')
    jedi4 = Jedi.new('KyloRen ', 'Dark Side')
    @jedis=[jedi1, jedi2, jedi3, jedi4]
    @turn = Turn.new(@jedis)
  end

  def run
    while (!game_over?)
      @turn.next_turn
      puts "====== Round ##{@turn.round} ======"
      puts "\n"
      summary
      puts "----- Attacking -----"
      current = @turn.current_player
      ennemy = @turn.ennemy_player
      current.attack(ennemy)
      puts "\n"
      sleep 1
    end
    end_game
  end
    
    def summary
      puts "------ Summary ------"
      puts @jedis.map{|jedi| jedi.summary}.join("\n")
      puts "\n"
    end

    def game_over?
      jedis.select{|jedi| !jedi.is_dead?}.count == 1
    end

    def end_game  
      puts "------- GAME OVER! -------"
      puts "\n"
      summary
      winning_jedi = @jedis.select{|jedi| !jedi.is_dead?}.first

      puts "#{winning_jedi.name.strip} won. The #{winning_jedi.side_force} has won!"

    end

end