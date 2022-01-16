# frozen_string_literal: true

RSpec.describe RubyCalendar::Calendar do
  describe "#new" do
    let(:today) { Date.today }

    context "default values" do
      let(:calendar) { RubyCalendar::Calendar.new }
      let(:year) { today.year }
      let(:month) { today.month }

      it { expect(calendar.year.lines.first.strip).to eq year.to_s }
      it { expect(calendar.month.lines.first.gsub(/#{year}/, "").strip).to eq Date.new(year, month).strftime("%B") }
      it { expect(calendar.firstweekday).to eq 0 }
    end

    context "pass keyword argument firstweekday" do
      let(:calendar) { RubyCalendar::Calendar.new(firstweekday: 1) }

      it { expect(calendar.firstweekday).to eq 1 }
    end
  end

  describe "#set_methods" do
    let(:year) { Date.today.year + 1 }
    let(:calendar) { RubyCalendar::Calendar.new(year) }

    context "#set_year" do
      before { calendar.set_year(year) }

      it "success change year" do
        expect(calendar.year.lines.first.strip).to eq year.to_s
      end
    end

    context "#set_month" do
      let(:change_month) { Date.new(year, 2).strftime("%B") }

      before { calendar.set_month(2) }

      it "success change month" do
        expect(calendar.month.lines.first.gsub(/#{year}/, "").strip).to eq change_month
      end
    end

    context "#set_firstweekday" do
      before { calendar.set_firstweekday(1) }

      it "success change firstweekday" do
        expect(calendar.firstweekday).to eq 1
      end
    end
  end

  describe "#private methods" do
    let(:today) { Date.today }
    let(:year) { 2021 }
    let(:month) { 1 }
    let(:width) { 3 }
    let(:calendar) { RubyCalendar::Calendar.new(today.year) }

    describe "#format_month_name" do
      subject { calendar.send(:format_month_name, year, month, width, withyear) }

      context "withyear: true" do
        let(:withyear) { true }

        it { is_expected.to eq "January 2021" }
      end

      context "withyear: false" do
        let(:withyear) { false }

        it { is_expected.to eq "January" }
      end
    end

    describe "#format_week_header" do
      subject { calendar.send(:format_week_header, width) }

      it "display week header" do
        is_expected.to eq "Sun Mon Tue Wed Thu Fri Sat"
      end
    end

    describe "#format_week_name" do
      subject { calendar.send(:format_week_name, [1, 2, 3, 4, 5, 6, 7], width) }

      it "display week name" do
        is_expected.to eq " 1   2   3   4   5   6   7 "
      end
    end

    describe "#format_day" do
      subject { calendar.send(:format_day, 1, width) }

      it { is_expected.to eq " 1 " }
    end

    describe "#month_days_calendar" do
      subject { calendar.send(:month_days_calendar, year, month) }
      let(:month_array) do
        [0, 0, 0, 0, 0, 1, 2,
         3, 4, 5, 6, 7, 8, 9,
         10, 11, 12, 13, 14, 15, 16,
         17, 18, 19, 20, 21, 22, 23,
         24, 25, 26, 27, 28, 29, 30,
         31, 0, 0, 0, 0, 0, 0]
      end

      it { is_expected.to eq month_array }
    end

    describe "#format_week_day" do
      subject { calendar.send(:format_week_day, width) }

      context "width is 9 or more" do
        let(:width) { 9 }

        it { is_expected.to eq %w[Sunday Monday Tuesday Wednesday Thursday Friday Saturday] }
      end

      context "width is 3 to 8" do
        let(:width) { rand(3..8) }

        it { is_expected.to eq %w[Sun Mon Tue Wed Thu Fri Sat] }
      end

      context "width is 2" do
        let(:width) { 2 }

        it { is_expected.to eq %w[Su Mo Tu We Th Fr Sa] }
      end

      context "width is 1" do
        let(:width) { 1 }

        it { is_expected.to eq %w[S M T W T F S] }
      end
    end
  end
end
