require "test_helper"

describe Turn do
  let(:turn) { Turn.new }

  it "must be valid" do
    value(turn).must_be :valid?
  end
end
