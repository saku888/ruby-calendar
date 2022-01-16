# frozen_string_literal: true

RSpec.describe RubyCalendar::Year do
  describe "#year" do
    let(:calendar) { RubyCalendar::Calendar.new(2021) }

    context "no argument" do
      year_calendar = <<~YEAR
                                          2021
              January                   February                   March
        Su Mo Tu We Th Fr Sa      Su Mo Tu We Th Fr Sa      Su Mo Tu We Th Fr Sa
                        1  2          1  2  3  4  5  6          1  2  3  4  5  6
         3  4  5  6  7  8  9       7  8  9 10 11 12 13       7  8  9 10 11 12 13
        10 11 12 13 14 15 16      14 15 16 17 18 19 20      14 15 16 17 18 19 20
        17 18 19 20 21 22 23      21 22 23 24 25 26 27      21 22 23 24 25 26 27
        24 25 26 27 28 29 30      28                        28 29 30 31
        31
               April                      May                       June
        Su Mo Tu We Th Fr Sa      Su Mo Tu We Th Fr Sa      Su Mo Tu We Th Fr Sa
                     1  2  3                         1             1  2  3  4  5
         4  5  6  7  8  9 10       2  3  4  5  6  7  8       6  7  8  9 10 11 12
        11 12 13 14 15 16 17       9 10 11 12 13 14 15      13 14 15 16 17 18 19
        18 19 20 21 22 23 24      16 17 18 19 20 21 22      20 21 22 23 24 25 26
        25 26 27 28 29 30         23 24 25 26 27 28 29      27 28 29 30
                                  30 31
                July                     August                  September
        Su Mo Tu We Th Fr Sa      Su Mo Tu We Th Fr Sa      Su Mo Tu We Th Fr Sa
                     1  2  3       1  2  3  4  5  6  7                1  2  3  4
         4  5  6  7  8  9 10       8  9 10 11 12 13 14       5  6  7  8  9 10 11
        11 12 13 14 15 16 17      15 16 17 18 19 20 21      12 13 14 15 16 17 18
        18 19 20 21 22 23 24      22 23 24 25 26 27 28      19 20 21 22 23 24 25
        25 26 27 28 29 30 31      29 30 31                  26 27 28 29 30
              October                   November                  December
        Su Mo Tu We Th Fr Sa      Su Mo Tu We Th Fr Sa      Su Mo Tu We Th Fr Sa
                        1  2          1  2  3  4  5  6                1  2  3  4
         3  4  5  6  7  8  9       7  8  9 10 11 12 13       5  6  7  8  9 10 11
        10 11 12 13 14 15 16      14 15 16 17 18 19 20      12 13 14 15 16 17 18
        17 18 19 20 21 22 23      21 22 23 24 25 26 27      19 20 21 22 23 24 25
        24 25 26 27 28 29 30      28 29 30                  26 27 28 29 30 31
        31
      YEAR

      it { expect(calendar.year).to eq year_calendar }
    end

    context "argument" do
      year_calendar = <<~YEAR
                                                                                                 2022

                  January                       February                         March                          April                           May                           June

        Sun Mon Tue Wed Thu Fri Sat    Sun Mon Tue Wed Thu Fri Sat    Sun Mon Tue Wed Thu Fri Sat    Sun Mon Tue Wed Thu Fri Sat    Sun Mon Tue Wed Thu Fri Sat    Sun Mon Tue Wed Thu Fri Sat

                                 1              1   2   3   4   5              1   2   3   4   5                          1   2      1   2   3   4   5   6   7                  1   2   3   4

         2   3   4   5   6   7   8      6   7   8   9  10  11  12      6   7   8   9  10  11  12      3   4   5   6   7   8   9      8   9  10  11  12  13  14      5   6   7   8   9  10  11

         9  10  11  12  13  14  15     13  14  15  16  17  18  19     13  14  15  16  17  18  19     10  11  12  13  14  15  16     15  16  17  18  19  20  21     12  13  14  15  16  17  18

        16  17  18  19  20  21  22     20  21  22  23  24  25  26     20  21  22  23  24  25  26     17  18  19  20  21  22  23     22  23  24  25  26  27  28     19  20  21  22  23  24  25

        23  24  25  26  27  28  29     27  28                         27  28  29  30  31             24  25  26  27  28  29  30     29  30  31                     26  27  28  29  30

        30  31

                   July                          August                        September                       October                       November                       December

        Sun Mon Tue Wed Thu Fri Sat    Sun Mon Tue Wed Thu Fri Sat    Sun Mon Tue Wed Thu Fri Sat    Sun Mon Tue Wed Thu Fri Sat    Sun Mon Tue Wed Thu Fri Sat    Sun Mon Tue Wed Thu Fri Sat

                             1   2          1   2   3   4   5   6                      1   2   3                              1              1   2   3   4   5                      1   2   3

         3   4   5   6   7   8   9      7   8   9  10  11  12  13      4   5   6   7   8   9  10      2   3   4   5   6   7   8      6   7   8   9  10  11  12      4   5   6   7   8   9  10

        10  11  12  13  14  15  16     14  15  16  17  18  19  20     11  12  13  14  15  16  17      9  10  11  12  13  14  15     13  14  15  16  17  18  19     11  12  13  14  15  16  17

        17  18  19  20  21  22  23     21  22  23  24  25  26  27     18  19  20  21  22  23  24     16  17  18  19  20  21  22     20  21  22  23  24  25  26     18  19  20  21  22  23  24

        24  25  26  27  28  29  30     28  29  30  31                 25  26  27  28  29  30         23  24  25  26  27  28  29     27  28  29  30                 25  26  27  28  29  30  31

        31                                                                                           30  31

      YEAR

      it { expect(calendar.year(2022, w: 3, l: 2, c: 4, m: 6)).to eq year_calendar }
    end
  end

  describe "#private month_to_i" do
    let(:today) { Date.today }
    let(:calendar) { RubyCalendar::Calendar.new(today.year) }

    describe "#month_to_i" do
      subject { calendar.send(:month_to_i, today.strftime("%B")) }

      it { is_expected.to eq today.month }
    end
  end
end
