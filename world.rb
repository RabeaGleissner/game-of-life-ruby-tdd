class World
  attr_reader :population

  def initialize(population)
    @population = population
  end

  def create
    if population
      still_alive?(population)
    else
      self.empty?
    end
  end

  def still_alive?(cell)
    false
  end

  def empty?
    true
  end

end