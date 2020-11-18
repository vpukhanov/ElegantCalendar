// Kevin Li - 6:10 PM - 7/14/20

import SwiftUI

public struct CalendarTheme: Equatable, Hashable {

    public let primary: Color

    public init(primary: Color) {
        self.primary = primary
    }

}

struct CalendarThemeKey: EnvironmentKey {

    static let defaultValue: CalendarTheme = CalendarTheme(primary: .primary)

}

extension EnvironmentValues {

    var calendarTheme: CalendarTheme {
        get { self[CalendarThemeKey.self] }
        set { self[CalendarThemeKey.self] = newValue }
    }

}
