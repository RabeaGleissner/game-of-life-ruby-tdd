class World
  attr_reader :population, :rows, :columns

  def initialize(population, rows, columns)
    @population = population
    @rows = rows
    @columns = columns
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
    elsif neighbour_count(cell) <= 3
      true
    elsif neighbour_count(cell) >= 4
      false
    end
  end

  def identify_reborns
    all_cells = []
    @rows.times do |row|
      @columns.times do |column|
        all_cells << [row, column]
      end
    end
    
    dead_cells = all_cells - @population 

    reborns = []
    dead_cells.each do |cell|
      if neighbour_count(cell) == 3
        reborns << cell
      else
        cell
      end
    end
    return reborns
  end

  def neighbour_count(cell)
    cell_row = cell.first 
    cell_col = cell.last

    neighbours_array = []

    @population.each do |inhabitant|

      inhabitant_row = inhabitant.first
      inhabitant_col = inhabitant.last

      if cell_row -1 == inhabitant_row && cell_col -1 == inhabitant_col
        neighbours_array << 1
      end
      if cell_row == inhabitant_row && cell_col -1 == inhabitant_col
        neighbours_array << 1
      end
      if cell_row +1 == inhabitant_row && cell_col -1 == inhabitant_col
        neighbours_array << 1
      end
      if cell_row -1 == inhabitant_row && cell_col == inhabitant_col
        neighbours_array << 1
      end
      if cell_row +1 == inhabitant_row && cell_col == inhabitant_col
        neighbours_array <<1
      end
      if cell_row -1 == inhabitant_row && cell_col +1 == inhabitant_col
        neighbours_array << 1
      end
      if cell_row == inhabitant_row && cell_col +1 == inhabitant_col
        neighbours_array << 1
      end
      if cell_row +1 == inhabitant_row && cell_col +1 == inhabitant_col
        neighbours_array << 1
      end
    end
    return neighbours_array.length
  end

  def empty?
    true
  end

end