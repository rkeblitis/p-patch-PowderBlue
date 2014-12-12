module CalendarsHelper

  # FOR THE FRONT PAGE CALENDAR
  def find_events_for_current_month
    @events = Event.all.where(date: @beginning_of_month..@end_of_month)
  end

  def get_exact_date(day)
    Date.new(@current_year, @current_month, day)
  end

  def get_events_of_the_day(date)
    @events_of_the_day = Event.all.where(date: date)
  end

  # FOR THE CALENDAR INDEX...repetitive logic for now
  def find_months_to_generate
    @dates_of_each_month = []
    @dates = Event.all.pluck(:date)
    @dates.each do |date|
      @dates_of_each_month << date.beginning_of_month
    end
    @dates_of_each_month.uniq!
  end

  def generate_each_month(month_date)
    @year = month_date.strftime("%Y").to_i
    @month = month_date.strftime("%m").to_i
    @first_of_month = Date.civil(@year, @month, 1)
    @last_of_month = Date.civil(@year, @month, -1)
  end

  def get_date(day)
    Date.new(@year, @month, day)
  end

  def find_events
    @events = Event.all.where(date: @first_of_month..@last_of_month)
  end

end
