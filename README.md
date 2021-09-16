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
calendar = RubyCalendar::Calendar.new
puts calendar.format_month(2021,1)
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

## Calendar class methods

### format_month(year, month, w=0, l=0)

Return a month’s calendar in a multi-line string.
* w: it specifies the width of the date columns which are centered(default: 0).
* l: it specifies the number of lines that each week will use(default: 0).

### set_firstweekday()


* it set the first day of the week to Monday(1) or to any other weekday.

```ruby
# at initialization 0(Sunday).
calendar = RubyCalendar::Calendar.new
# => #<RubyCalendar::Calendar:0x00007fd334b9c0d0 @firstweekday=0>

calendar.set_firstweekday(1) # set the first day of the week to Monday
puts calendar.format_month(2021,1)
#     January 2021
# Mo Tu We Th Fr Sa Su
#              1  2  3
#  4  5  6  7  8  9 10
# 11 12 13 14 15 16 17
# 18 19 20 21 22 23 24
# 25 26 27 28 29 30 31
=> nil
```

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/[USERNAME]/ruby_calendar. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [code of conduct](https://github.com/saku888/ruby-calendar/blob/master/CODE_OF_CONDUCT.md).

## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).

## Code of Conduct

Everyone interacting in the RubyCalendar project's codebases, issue trackers, chat rooms and mailing lists is expected to follow the [code of conduct](https://github.com/saku888/ruby-calendar/blob/master/CODE_OF_CONDUCT.md).
