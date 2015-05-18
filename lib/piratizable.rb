module Piratizable

  def piratize
    Piratize.piratize self
  end

end

class String ; include Piratizable end
class Hash ; include Piratizable end
class Array ; include Piratizable end
class Float ; include Piratizable end
