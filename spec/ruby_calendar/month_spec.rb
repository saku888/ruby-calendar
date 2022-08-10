# frozen_string_literal: true

RSpec.describe RubyCalendar::Month do
  describe "#month" do
    let(:calendar) { RubyCalendar::Calendar.new(2021, 1) }

    context "no argument" do
      month_calendar = <<~MONTH
            January 2021
        Su Mo Tu We Th Fr Sa
                        1  2
         3  4  5  6  7  8  9
        10 11 12 13 14 15 16
        17 18 19 20 21 22 23
        24 25 26 27 28 29 30
        31
      MONTH

      it { expect(calendar.month).to eq month_calendar }
    end

    context "argument" do
      month_calendar = <<~MONTH
               February 2022

        Sun Mon Tue Wed Thu Fri Sat

                 1   2   3   4   5

         6   7   8   9  10  11  12

        13  14  15  16  17  18  19

        20  21  22  23  24  25  26

        27  28

      MONTH

      it { expect(calendar.month(2022, 2, w: 3, l: 2)).to eq month_calendar }
    end
  end
end
