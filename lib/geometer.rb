require 'geometer/version'

require 'geometer/point'
require 'geometer/line'
require 'geometer/dimensions'
require 'geometer/rectangle'

module Geometer
  module PointHelpers
    def coord(x,y); Point.new(x,y) end
  end

  module DimensionHelpers
    def dim(w,h); Dimensions.new(w,h) end
  end

  module LineHelpers
    def dist(a,b)
      Line.new(a,b).length
    end
  end
end
