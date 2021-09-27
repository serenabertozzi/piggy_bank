class PiggyBank
  def initialize
    @piggy_bank_total = 0
    @broken = false
  end

  def add_coins(coins)
    fail_if_broken
    @piggy_bank_total += coins
  end

  def shake
    fail_if_broken
    fail "It's empty!" if @piggy_bank_total < 1
    "cling cling"
  end

  def break
    fail_if_broken
    @broken = true
    @piggy_bank_total
  end

  private

  def fail_if_broken
    fail "It's broken!" if @broken == true
  end
end
