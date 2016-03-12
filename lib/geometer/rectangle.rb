module Geometer
  class Rectangle < Struct.new(:origin, :dimensions)
    def contains?(position)
      dimensions.contains?(position.translate(-origin)) 
    end

    def area
      dimensions.area
    end
  end
end
