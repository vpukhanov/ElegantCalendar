// Kevin Li - 7:18 PM - 6/13/20

import SwiftUI

struct SmallWeekView: View, YearlyCalendarManagerDirectAccess {

    @EnvironmentObject var calendarManager: YearlyCalendarManager

    let week: Date

    private var days: [Date] {
        guard let weekInterval = calendar.dateInterval(of: .weekOfYear, for: week) else {
            return []
        }
        return calendar.generateDates(
            inside: weekInterval,
            matching: .everyDay)
    }

    var body: some View {
        HStack(spacing: CalendarConstants.Yearly.daysGridHorizontalSpacing) {
            ForEach(days, id: \.self) { day in
                SmallDayView(week: self.week, day: day)
            }
        }
    }

}

struct SmallWeekView_Previews: PreviewProvider {
    static var previews: some View {
        YearlyCalendarManagerGroup {
            DarkThemePreview {
                SmallWeekView(week: Date())
            }

            DarkThemePreview {
                SmallWeekView(week: .daysFromToday(-7))
            }
        }
    }
}