module RubyCalendar
  class Calendar
    attr_accessor :firstweekday

    WEEK_DAY_NAME = %w[Sunday Monday Tuesday Wednesday Thursday Friday Saturday].freeze
    MONTH_NAMES = %w[January February March April May June July August September October November December].freeze

    def initialize
      @firstweekday = 0
    end

    def set_firstweekday(firstweekday)
      @firstweekday = firstweekday
    end

    def month(year, month, w=0, l=0)
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

    def calendar(year, w=2, l=1, c=6, m=3)
      w = [2, w].max
      l = [1, l].max
      c = [2, c].max
      colwidth = 7*(w+1)-1
      a = []
      a.push(year.to_s.center(colwidth*m+c*(m-1)).rstrip)
      a.push("\n"*l)
      header = format_week_header(w)
      MONTH_NAMES.each_slice(m).to_a.each do |months|
        a.push(months.map{|month| format_month_name(year, month_to_i(month), colwidth, false) << (' '*c)}.join.rstrip)
        a.push("\n"*l)
        a.push(months.map{format_week_header(w) << (' '*c)}.join.rstrip)
        a.push("\n"*l)
        month_array = months.map{|month| month_days_calendar(year, month_to_i(month))}
        slice_month_array = month_array.map{|array| array.each_slice(7).to_a}
        max_element_count = slice_month_array.map{|array| array.length}.max - 1
        replace_array = []
        for num in 0..max_element_count do
          replace_array.push(slice_month_array.map {|array| array[num].nil? ? [] : array[num]})
        end
        replace_array.each do |weeks|
          a.push(weeks.map{|week| format_week_name(week, w) << (' '*c)}.join.rstrip)
          a.push("\n"*l)
        end
      end
      a
    end

    private

    def month_to_i(month)
      MONTH_NAMES.index(month)+1
    end

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

    def format_month_name(year, month, width, withyear=true)
      if withyear
        Date.new(year, month).strftime("%B #{year}").center(width)
      else
        Date.new(year, month).strftime("%B").center(width)
      end
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
      lastday_wday = (6 + @firstweekday - Date.new(year, month, -1).wday) % 7

      days = Array.new(firstday_wday){0}
      days.push(*1..lastday_date)
      lastday_wday.times{ days.push(0) }
      days
    end

    def format_week_name(week, width)
      if week.empty?
        Array.new(7){0}.map{|day| format_day(day, width)}.join(' ')
      else
        week.map{|day| format_day(day, width)}.join(' ')
      end
    end
  end
end
