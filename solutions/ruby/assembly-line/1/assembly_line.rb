class AssemblyLine
  def initialize(speed)
    @speed = speed
  end

  def production_rate_per_hour
    production = 221 * @speed
    if @speed > 9
      production * 0.77
    elsif @speed > 8
      production * 0.8
    elsif @speed > 4
      production * 0.9  
    else
      production
    end
  end

  def working_items_per_minute
    (production_rate_per_hour / 60).floor
  end
end
