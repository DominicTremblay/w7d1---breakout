require_relative './jedi'

class Game

  attr_reader :jedis
  attr_accessor :round

  def initialize
    jedi1 = Jedi.new('Yoda')
    jedi2 = Jedi.new('vador')
    @jedis=[jedi1, jedi2]
    @round = 1
  end

  def run
    while (!game_over?)
      puts "====== Round ##{@round} ======"
      puts "\n"
      summary
      puts "----- Attacking -----"
      current = get_current_jedi
      ennemy = get_ennemy_jedi(current)
      current.attack(ennemy)
      puts "\n"
      @round += 1
      sleep 1
    end
  end
    
    def summary
      puts "------ Summary ------"
      puts @jedis.map{|jedi| jedi.summary}.join("\n")
      puts "\n"
    end

    def game_over?
      jedis.any?{|jedi| jedi.is_dead?}
    end

    def get_current_jedi
      @jedis[(@round - 1) % jedis.length]
    end

    def get_ennemy_jedi(current)
      @jedis.select{|jedi| jedi != current}.sample
    end

end