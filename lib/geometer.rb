require 'geometer/version'

require 'geometer/point'
require 'geometer/line'
require 'geometer/dimensions'
require 'geometer/rectangle'

module Geometer
  module LineHelpers
    def dist(a,b)
      Line.new(a,b).length
    end
  end
end
