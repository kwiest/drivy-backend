require 'date'

class Rental
  attr_accessor :id, :car_id, :start_date, :end_date, :distance, :options

  def initialize(id:, car_id:, start_date:, end_date:, distance:, **options)
    @id = id
    @car_id = car_id
    @start_date = Date.parse(start_date)
    @end_date = Date.parse(end_date)
    @distance = distance
    @options = default_options.merge(options)
  end

  def time
    (end_date - start_date + 1).to_i
  end


  private

  def default_options
    {
      deductible_reduction: false
    }
  end
end
