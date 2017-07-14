require 'date'

class Rental
  class DateError < Exception; end

  attr_accessor :id, :car_id, :start_date, :end_date, :distance, :options

  def initialize(id:, car_id:, start_date:, end_date:, distance:, **options)
    @id = id
    @car_id = car_id
    @start_date = Date.parse(start_date)
    @end_date = Date.parse(end_date)
    @distance = distance
    @options = default_options.merge(options)
    raise DateError.new("end_date cannot be before start_date") if @end_date < @start_date
  end

  def time
    (end_date - start_date + 1).to_i
  end

  def to_h
    {
      id: id,
      car_id: car_id,
      start_date: start_date.to_s,
      end_date: end_date.to_s,
      distance: distance,
      options: options
    }
  end


  private

  def default_options
    {
      deductible_reduction: false
    }
  end
end
