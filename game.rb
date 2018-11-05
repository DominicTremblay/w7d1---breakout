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
    
    puts "====== Round ##{@round} ======"
    puts "\n"
    summary
    puts "----- Attacking -----"
  end
    
    def summary
      puts "------ Summary ------"
      puts @jedis.map{|jedi| jedi.summary}.join("\n")
      puts "\n"
    end

end