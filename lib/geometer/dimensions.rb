module Geometer
  class Dimensions < Struct.new(:width, :height)
    def inspect
      "#{width}x#{height}"
    end

    def contains?(position)
      x,y=*position
      x_range.include?(x) && y_range.include?(y)
    end

    def sample
      x,y = x_range.to_a.sample, y_range.to_a.sample
      coord(x,y)
    end

    def area
      x_range.size * y_range.size
    end

    def x_range
      0..(width-1)
    end

    def y_range
      0..(height-1)
    end

    def all_locations
      @all_locations ||= assemble_all_locations
    end

    def assemble_all_locations
      locs = []
      x_range.each do |x|
        y_range.each do |y|
          locs.push coord(x,y)
        end
      end
      locs
    end
  end
end
