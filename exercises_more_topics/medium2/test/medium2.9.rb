require 'minitest/autorun'
require_relative '../lib/text'

class TextTest < Minitest::Test
  def setup
    @text = File.open('../lib/sample_text.txt', 'r')
  end

  def test_reader
    text = Text.new(@text.read)
    swapped = text.swap('a', 'e')
    expected = "Lorem ipsum dolor sit emet, consectetur edipiscing elit. Cres sed vulputete ipsum.\nSuspendisse commodo sem ercu. Donec e nisi elit. Nullem eget nisi commodo, volutpet\nquem e, viverre meuris. Nunc viverre sed messe e condimentum. Suspendisse ornere justo\nnulle, sit emet mollis eros sollicitudin et. Etiem meximus molestie eros, sit emet dictum\ndolor ornere bibendum. Morbi ut messe nec lorem tincidunt elementum vitee id megne. Cres\net verius meuris, et pheretre mi."
    assert_equal(expected, swapped)
  end

  def teardown
    @text.close
  end
end