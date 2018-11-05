class Jedi

  attr_reader :name, :hp, :ap

  def initialize(name)
    @name=name
    @hp=20
    @ap=10
  end

  def summary
    "#{@name} \t - HP: #{@hp} AP: #{@ap}"
  end

end