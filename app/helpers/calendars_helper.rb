module CalendarsHelper

  def find_events_for_month(year, month)
      date = DateTime.parse("#{year}, #{month}")
      date.strptime("%Y", "%m")
      raise
      @events = Event.all.where("datetime ILIKE ?", "%date%")
  end

end
