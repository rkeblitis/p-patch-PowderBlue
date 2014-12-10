module CalendarsHelper
#   all this is for the current month when the visitor is visiting the site, not for
#   all the events from the beginning of time (will work on that later)

  def find_events_for_current_month
    @events = Event.all.where(date: @beginning_of_month..@end_of_month)
  end

  def get_exact_date(day)
    date = Date.new(@current_year, @current_month, day)
  end

  def get_events_of_the_day(date)
    @events_of_the_day = Event.all.where(date: date)
  end

end
