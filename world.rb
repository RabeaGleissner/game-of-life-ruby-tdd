class World
  attr_reader :population, :rows, :columns

  def initialize(population, rows, columns)
    @population = population
    @rows = rows
    @columns = columns
  end

  def next_gen
    cell_array = []

    @population.each do |live_cell|
      if still_alive?(live_cell) == true
        cell_array << live_cell
      end
    end
    identify_reborns.each do |live_cell| 
      cell_array << live_cell
    end
    return cell_array
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

    @population.each do |live_cell|

      live_cell_row = live_cell.first
      live_cell_col = live_cell.last

      if cell_row -1 == live_cell_row && cell_col -1 == live_cell_col
        neighbours_array << 1
      end
      if cell_row == live_cell_row && cell_col -1 == live_cell_col
        neighbours_array << 1
      end
      if cell_row +1 == live_cell_row && cell_col -1 == live_cell_col
        neighbours_array << 1
      end
      if cell_row -1 == live_cell_row && cell_col == live_cell_col
        neighbours_array << 1
      end
      if cell_row +1 == live_cell_row && cell_col == live_cell_col
        neighbours_array <<1
      end
      if cell_row -1 == live_cell_row && cell_col +1 == live_cell_col
        neighbours_array << 1
      end
      if cell_row == live_cell_row && cell_col +1 == live_cell_col
        neighbours_array << 1
      end
      if cell_row +1 == live_cell_row && cell_col +1 == live_cell_col
        neighbours_array << 1
      end
    end
    return neighbours_array.length
  end

  def empty?
    if @population.any?
      false
    else
      true
    end
  end

end