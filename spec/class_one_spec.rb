require 'spec_helper'
require 'class_one'

describe ClassOne do

  describe "covered" do
    it "returns 'covered'" do
      expect(ClassOne.covered).to eql("covered")
    end
  end

  # Uncomment below to achieve 100% coverage
  describe "uncovered" do
    it "returns 'uncovered'" do
      expect(ClassOne.uncovered).to eql("uncovered")
    end
  end

  # Uncomment below to raise coverage — trival change
  describe "delta" do
    it "returns 'uncovered'" do
      expect(ClassOne.delta).to eql("delta")
    end
  end

  # Uncomment below to raise coverage — trival change
  describe "omega" do
    it "returns 'omega'" do
      expect(ClassOne.omega).to eql("omega")
    end
  end

  # Uncomment below to raise coverage — trival change
  describe "alpha" do
    it "returns 'alpha'" do
      expect(ClassOne.alpha).to eql("alpha")
    end
  end
end
