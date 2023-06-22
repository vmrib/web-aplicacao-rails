require "test_helper"

class DocumentoTest < ActiveSupport::TestCase
  test "valid document" do
    valid = documentos(:valid)
    assert valid.save
  end

  test "invalid document" do
    invalid = documentos(:rgInvalidChar)
    assert_not invalid.save

    invalid = documentos(:cpfInvalidChar)
    assert_not invalid.save

    invalid = documentos(:noRg)
    assert_not invalid.save

    invalid = documentos(:noCpf)
    assert_not invalid.save
  end

  test "uniqueness document" do
    valid = documentos(:valid)
    assert valid.save

    sameDocument = documentos(:valid)
    assert_not sameDocument.save
  end
end
