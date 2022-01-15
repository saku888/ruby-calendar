module RubyCalendar
  module Month
    def month(year=@year, month=@month, w:0, l:0)
      w = [2, w].max
      l = [1, l].max
      s = format_month_name(month, 7*(w+1)-1)
      s = s.rstrip
      s += "\n" * l
      s += format_week_header(w).rstrip
      s += "\n" * l
      month_days_calendar(year, month).each_slice(7).to_a.each do |week|
        s += format_week_name(week, w).rstrip
        s += "\n" * l
      end
      s
    end
  end
end
