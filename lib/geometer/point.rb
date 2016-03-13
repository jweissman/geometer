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

  module PointHelpers
    def coord(x,y); Point.new(x,y) end
  end
end
