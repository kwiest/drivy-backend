class Commission
  attr_accessor :rental_price, :days, :amount

  def initialize(rental_price, days)
    @rental_price = rental_price
    @days = days
    @amount = (rental_price * 0.3).to_i
  end

  def insurance_fee
    (amount / 2).to_i
  end

  def assistance_fee
    days * 100
  end

  def drivy_fee
    amount - insurance_fee - assistance_fee
  end

  def to_h
    {
      insurance_fee: insurance_fee,
      assistance_fee: assistance_fee,
      drivy_fee: drivy_fee
    }
  end
end
