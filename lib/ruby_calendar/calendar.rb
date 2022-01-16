# frozen_string_literal: true

require "ruby_calendar/month"
require "ruby_calendar/year"

module RubyCalendar
  class Calendar
    include RubyCalendar::Month
    include RubyCalendar::Year

    attr_accessor :firstweekday

    WEEK_DAY_NAME = %w[Sunday Monday Tuesday Wednesday Thursday Friday Saturday].freeze

    def initialize(year = today_year, month = today_month, firstweekday: 0)
      @year = year
      @month = month
      @firstweekday = firstweekday
    end

    def set_year(year)
      @year = year
      self
    end

    def set_month(month)
      @month = month
      self
    end

    def set_firstweekday(firstweekday)
      @firstweekday = firstweekday
      self
    end

    private

    def today_year
      Date.today.year
    end

    def today_month
      Date.today.month
    end

    def format_month_name(year, month, width, withyear = true)
      if withyear
        Date.new(year, month).strftime("%B #{year}").center(width)
      else
        Date.new(year, month).strftime("%B").center(width)
      end
    end

    def format_week_header(width)
      format_week_day(width).map { |day| day.center(width) }.join(" ")
    end

    def format_week_name(week, width)
      if week.empty?
        Array.new(7) { 0 }.map { |day| format_day(day, width) }.join(" ")
      else
        week.map { |day| format_day(day, width) }.join(" ")
      end
    end

    def format_day(day, width)
      s = day.zero? ? "" : day.to_s.rjust(2)
      s.center(width)
    end

    def month_days_calendar(year, month)
      firstday_wday = (Date.new(year, month, 1).wday - @firstweekday) % 7
      lastday_date = Date.new(year, month, -1).day
      lastday_wday = (6 + @firstweekday - Date.new(year, month, -1).wday) % 7

      days = Array.new(firstday_wday) { 0 }
      days.push(*1..lastday_date)
      lastday_wday.times { days.push(0) }
      days
    end

    def format_week_day(width)
      names = WEEK_DAY_NAME.rotate(@firstweekday)
      if width >= 9
        names
      else
        names.map { |name| name.slice(0, [3, width].min) }
      end
    end
  end
end
