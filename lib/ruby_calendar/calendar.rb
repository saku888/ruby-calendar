module RubyCalendar
  class Calendar
    attr_accessor :firstweekday

    WEEK_DAY_NAME = %w[Sunday Monday Tuesday Wednesday Thursday Friday Saturday].freeze

    def initialize
      @firstweekday = 0
    end

    def set_firstweekday(firstweekday)
      @firstweekday = firstweekday
    end

    def format_month(year, month, w=0, l=0)
      w = [2, w].max
      l = [1, l].max
      s = format_month_name(year, month, 7*(w+1)-1)
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

    private

    def localized_day(format)
      days = []
      for i in 1..7 do
        days << (Date.new(2001,1,i).strftime(format))
      end
      days
    end

    def format_day(day, width)
      s = day.zero? ? '' : day.to_s.rjust(2)
      s.center(width)
    end

    def format_month_name(year, month, width)
      Date.new(year, month).strftime("%B #{year}").center(width)
    end

    def format_week_header(width)
      format_week_day(width).map{|day| day.center(width) }.join(' ')
    end

    def format_week_day(width)
      names = WEEK_DAY_NAME.rotate(@firstweekday)
      if width >= 9
        names
      else
        names.map{|name| name.slice(0, [3, width].min)} if width < 9
      end
    end

    def month_days_calendar(year, month)
      firstday_wday = (Date.new(year, month, 1).wday - @firstweekday) % 7
      lastday_date = Date.new(year, month, -1).day

      days = Array.new(firstday_wday){0}
      days.push(*1..lastday_date)
    end

    def format_week_name(week, width)
      week.map{|day| format_day(day, width)}.join(' ')
    end
  end
end
