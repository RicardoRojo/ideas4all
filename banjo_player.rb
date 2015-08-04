class BanjoPlayer

  def initialize;end

  def plays_banjo(name)
    name.start_with?("r","R") ? "#{name} plays banjo" : "#{name} does not play banjo"
  end
end