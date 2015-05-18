class ShipWreck

  def initialize ship
    @original_ship = ship
    ship.sink!
  end

end
