require 'spec_helper'
require 'pry'
require 'geometer'

describe Geometer do
  it "should have a VERSION constant" do
    expect(subject.const_get('VERSION')).to_not be_empty
  end
end

describe Point do
  include PointHelpers
  let(:a) { coord(0,5) }
  it 'should invert' do
    expect(-a).to eq(coord(0,-5))
  end

  it 'should scale' do
    expect(a*5).to eq(coord(0,25))
  end

  it 'should divide' do
    expect(a/2).to eq(coord(0,2.5))
  end
end

describe Line do
  include PointHelpers

  describe "measuring the hypotenuse" do
    context "of a 3-4-5 triangle" do
      let(:point_a) { coord(0,3) }
      let(:point_b) { coord(4,0) }
      it 'should find the hypotenuse to be 5' do
        expect(Line.new(point_a,point_b).length).to eq(5)
      end
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

  describe "#area" do
    it 'should have an area' do
      expect(rectangle.area).to eq(4)
    end
  end

  describe "#contains?" do
    it 'should identify points within itself' do
      expect(rectangle.contains?(coord(1,1))).to eq(true)
      expect(rectangle.contains?(coord(1,0))).to eq(false)
      expect(rectangle.contains?(coord(1,-1))).to eq(false)
    end
  end
end
