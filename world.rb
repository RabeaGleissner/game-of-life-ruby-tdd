class World

  def create(*cell)
    if cell
      still_alive?(cell)
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