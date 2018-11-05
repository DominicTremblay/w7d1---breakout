class Jedi

  attr_reader :name, :ap, :side_force
  attr_accessor :hp

  def initialize(name, side)
    @name=name
    @hp=20
    @ap=10
    @side_force=side
  end

  def summary
    feed = "#{@name} \t - HP: #{@hp} AP: #{@ap}"
    feed += " Dead Jedi!" if is_dead?
    feed
  end

  def attack(ennemy)
    puts "#{@name.strip} attacks #{ennemy.name.strip}"
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