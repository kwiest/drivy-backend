class Commission
  attr_accessor :rental_price, :days, :commission_amount
  attr_accessor :commission_amount

  def initialize(rental_price, days)
    @rental_price = rental_price
    @days = days
    @commission_amount = (rental_price * 0.3).to_i
  end

  def insurance_fee
    (commission_amount / 2).to_i
  end

  def assistance_fee
    days * 100
  end

  def drivy_fee
    commission_amount - insurance_fee - assistance_fee
  end

  def to_h
    {
      insurance_fee: insurance_fee,
      assistance_fee: assistance_fee,
      drivy_fee: drivy_fee
    }
  end
end
