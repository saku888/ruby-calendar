module RubyCalendar
  module Year
    MONTH_NAMES = %w[January February March April May June July August September October November December].freeze

    def year(year=@year, w:2, l:1, c:6, m:3)
      w = [2, w].max
      l = [1, l].max
      c = [2, c].max
      colwidth = 7*(w+1)-1
      calendar = []
      calendar.push(year.to_s.center(colwidth*m+c*(m-1)).rstrip)
      calendar.push("\n"*l)
      MONTH_NAMES.each_slice(m).to_a.each do |months|
        calendar.push(months.map{|month| format_month_name(month_to_i(month), colwidth, false) << (' ' * c)}.join.rstrip)
        calendar.push("\n"*l)
        calendar.push(months.map{format_week_header(w) << (' '*c)}.join.rstrip)
        calendar.push("\n"*l)
        month_array = months.map{|month| month_days_calendar(year, month_to_i(month))}
        slice_month_array = month_array.map{|array| array.each_slice(7).to_a}
        max_element_count = slice_month_array.map{|array| array.length}.max - 1
        replace_array = []
        for num in 0..max_element_count do
          replace_array.push(slice_month_array.map {|array| array[num].nil? ? [] : array[num]})
        end
        replace_array.each do |weeks|
          calendar.push(weeks.map{|week| format_week_name(week, w) << (' '*c)}.join.rstrip)
          calendar.push("\n"*l)
        end
      end
      calendar
    end

    private

    def month_to_i(month)
      MONTH_NAMES.index(month) + 1
    end
  end
end
