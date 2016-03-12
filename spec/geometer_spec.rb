require 'spec_helper'
require 'pry'
require 'geometer'

describe Geometer do
  it "should have a VERSION constant" do
    expect(subject.const_get('VERSION')).to_not be_empty
  end
end

describe Line do
  include PointHelpers
  let(:point_a) { coord(0,3) }
  let(:point_b) { coord(4,0) }

  describe "measuring the hypotenuse" do
    it 'should find a 3-4-5 triangle' do
      expect(Line.new(point_a,point_b).length).to eq(5)
    end

    it 'should find a 1-1-root(2) triangle' do
      expect(Line.new(coord(1,0),coord(0,1)).length).to eq(Math.sqrt(2))
    end
  end
end

describe Rectangle do
  include PointHelpers
  include DimensionHelpers

  subject(:rectangle) { Rectangle.new(origin,dimensions) }
  let(:origin) { coord(1,1) }
  let(:dimensions) { dim(2,2) }

  it 'should identify points within itself' do
    expect(rectangle.contains?(coord(1,1))).to eq(true)
    expect(rectangle.contains?(coord(1,0))).to eq(false)
    expect(rectangle.contains?(coord(1,-1))).to eq(false)
  end
end
