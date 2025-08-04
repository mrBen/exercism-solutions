module Port
  IDENTIFIER = :PALE

  def self.get_identifier(city)
    city[0..3].to_sym.upcase
  end

  def self.get_terminal(ship_identifier)
    if ["OIL", "GAS"].include?(ship_identifier.to_s[0..2])
      :A
    else
      :B
    end
  end
end
