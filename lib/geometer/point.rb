module Geometer
  class Point < Struct.new(:x, :y)
    def inspect
      "(#{x},#{y})"
    end

    def -@
      Point.new(-x,-y)
    end

    def translate(other_point)
      dx,dy = *other_point
      Point.new(x+dx, y+dy)
    end
  end
end
