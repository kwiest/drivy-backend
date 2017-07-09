require 'date'

class Rental
  attr_accessor :id, :car_id, :start_date, :end_date, :distance

  def initialize(id:, car_id:, start_date:, end_date:, distance:)
    @id = id
    @car_id = car_id
    @start_date = Date.parse(start_date)
    @end_date = Date.parse(end_date)
    @distance = distance
  end

  def time
    (end_date - start_date + 1).to_i
  end
end
