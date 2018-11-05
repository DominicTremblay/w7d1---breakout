class Jedi

  attr_reader :name, :ap
  attr_accessor :hp

  def initialize(name)
    @name=name
    @hp=20
    @ap=10
  end

  def summary
    "#{@name} \t - HP: #{@hp} AP: #{@ap}"
  end

  def attack(ennemy)
    puts "#{@name} attacks #{ennemy.name}"
    damage = rand(@ap) + 1
    ennemy.takes_damage(damage)
  end
  
  def takes_damage(ap)
    puts "#{@name} is taking #{ap} points damage!"
    @hp -= ap
  end

  def is_dead?
    @hp <= 0
  end

end