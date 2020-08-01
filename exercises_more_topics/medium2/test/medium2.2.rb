require 'minitest/autorun'
require_relative '../lib/cash_register'
require_relative '../lib/transaction'

class CashRegisterTest < Minitest::Test
  def setup
    @cash_register = CashRegister.new(100)
  end
end