# RubyCalendar

## Description

`ruby_calendar` is allows you to calendar output calendars like the Unix cal program.

## Installation

Install it yourself as:

```sh
$ gem install ruby_calendar
```

## Usage

* Output calendars

```ruby
calendar = RubyCalendar::Calendar.new(2021, 1)
puts calendar.month
#     January 2021
# Su Mo Tu We Th Fr Sa
#                 1  2
#  3  4  5  6  7  8  9
# 10 11 12 13 14 15 16
# 17 18 19 20 21 22 23
# 24 25 26 27 28 29 30
# 31
# => nil
```

## Setting calendar methods

### set_year()

It specifies the year for which the calendar is displayed (default: 2021).
Change by giving a number to the argument.

ex) 2021 -> 2022.
```ruby
calendar = RubyCalendar::Calendar.new(2021, 1)
# => #<RubyCalendar::Calendar:0x00007f9a58161788 @year=2021, @month=1, @firstweekday=0>
calendar.set_year(2022)
# => #<RubyCalendar::Calendar:0x00007f9a58161788 @year=2022, @month=1, @firstweekday=0>
```

### set_month()

It specifies the month to display(month method) the monthly calendar(default: January).
Change by giving a number to the argument.

ex) 1(January) -> 1(December).
```ruby
calendar = RubyCalendar::Calendar.new(2021, 1)
# => #<RubyCalendar::Calendar:0x00007f9a58161788 @year=2021, @month=1, @firstweekday=0>
calendar.set_month(12)
# => #<RubyCalendar::Calendar:0x00007f9a58149598 @year=2021, @month=12, @firstweekday=0>
```

### set_firstweekday()

It specifies the beginning of the week(default: Sunday).
Change by giving a number to the argument.

ex) 0(Sunday) -> 1(Monday).
```ruby
calendar = RubyCalendar::Calendar.new(2021, 1)
# => #<RubyCalendar::Calendar:0x00007f9a58132460 @year=2021, @month=1, @firstweekday=0>
calendar.set_firstweekday(1)
# => #<RubyCalendar::Calendar:0x00007f9a58132460 @year=2021, @month=1, @firstweekday=1>
```

## Output calendar methods

### month(year, month, w:0, l:0)

Return a month’s calendar in a multi-line string.

- The following keyword arguments can be used.
  - w: it specifies the width of the date columns which are centered(default: 0).
  - l: it specifies the number of lines that each week will use(default: 0).

### year(year, w:0, l:0, c:6, m:3)

Return a year’s calendar in a multi-line string.

- The following keyword arguments can be used.
  - w: it specifies the width of the date columns which are centered(default: 0).
  - l: it specifies the number of lines that each week will use(default: 0).
  - c: it specifies the monthly calendar interval(default: 6).
  - m: it specifies the number of months to display on one line(default: 3).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/[USERNAME]/ruby_calendar. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [code of conduct](https://github.com/saku888/ruby-calendar/blob/master/CODE_OF_CONDUCT.md).

## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).

## Code of Conduct

Everyone interacting in the RubyCalendar project's codebases, issue trackers, chat rooms and mailing lists is expected to follow the [code of conduct](https://github.com/saku888/ruby-calendar/blob/master/CODE_OF_CONDUCT.md).
