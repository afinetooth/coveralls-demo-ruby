require 'spec_helper'
require 'class_one'

describe ClassOne do

  # One more change (comment) irrelevant to coverage
  # Another change (comment) irrelevant to coverage
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
end
