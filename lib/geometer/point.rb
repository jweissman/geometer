module Geometer
  class Point < Struct.new(:x, :y)
    def inspect
      "(#{x},#{y})"
    end

    def invert
      Point.new(-x,-y)
    end
    alias_method :-@, :invert
    
    def scale(sz)
      Point.new(x*sz,y*sz)
    end
    alias_method :*, :scale

    def divide(sz)
      scale(1.0/sz)
    end
    alias_method :/, :divide

    def translate(other_point)
      dx,dy = *other_point
      Point.new(x+dx, y+dy)
    end

    def to_i
      Point.new(x.to_i, y.to_i)
    end
  end

  module PointHelpers
    def coord(x,y); Point.new(x,y) end
  end
end
