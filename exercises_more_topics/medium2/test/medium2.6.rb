require 'minitest/autorun'
require_relative '../lib/cash_register'
require_relative '../lib/transaction'

class CashRegisterTest < Minitest::Test
  def setup
    @cash_register = CashRegister.new(100)
    @transaction1 = Transaction.new(50)
    @transaction1.amount_paid = 50
  end

  def test_accept_money
    previous_cash_register = @cash_register.total_money
    @cash_register.accept_money(@transaction1)
    assert_equal(previous_cash_register + @transaction1.amount_paid, @cash_register.total_money)
  end

  def test_change
    assert_equal(0, @cash_register.change(@transaction1))
    @transaction1.amount_paid = 100
    assert_equal(50, @cash_register.change(@transaction1))
  end

  def test_give_receipt
    assert_output("You've paid $50.\n") { @cash_register.give_receipt(@transaction1) }
  end

  def test_prompt_for_payment
    input = StringIO.new("50\n")
    output = StringIO.new
    @transaction1.prompt_for_payment(input: input, output: output)
    assert_equal(50.0, @transaction1.amount_paid)
  end


end