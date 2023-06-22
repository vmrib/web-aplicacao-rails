require "test_helper"

class EstadoTest < ActiveSupport::TestCase
  test "valid state" do
    valid = estados(:valid)
    assert valid.save?
  end

  test "invalid state" do
    invalid = estados(:tooLong)
    assert_not invalid.save

    invalid = estados(:invalidChar)
    assert_not invalid.save

    invalid = estados(:noSigla)
    assert_not invalid.save
  end

  test "uniqueness state" do
    valid = estados(:valid)
    assert valid.save

    sameState = estados(:valid)
    assert_not sameState.save
  end
end
