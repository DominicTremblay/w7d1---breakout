require_relative './jedi'

class Game

  attr_reader :jedis

  def initialize
    jedi1 = Jedi.new('Yoda')
    jedi2 = Jedi.new('vador')
    @jedis=[jedi1, jedi2]
  end

  def run
    puts @jedis[0].inspect
    puts @jedis[1].inspect
  end


end