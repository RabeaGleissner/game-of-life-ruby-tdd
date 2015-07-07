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
    if neighbour_count(cell) < 2
      false
    else
      true
    end
  end

  def neighbour_count(cell)
    cell_row = cell.first 
    cell_column = cell.last

    if @population.include?([cell_row, cell_column+1] && [cell_row+1, cell_column])

      return 2
    else
      return 0
    end
    
  end

  def empty?
    true
  end

end