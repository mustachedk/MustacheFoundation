
import Foundation

public extension Calendar {

    static var daDK: Calendar {
        var calendar = Calendar(identifier: .gregorian)
        calendar.timeZone = TimeZone(identifier: "Europe/Copenhagen")!
        calendar.locale = Locale(identifier: "da_DK")
        return calendar
    }

    func endOfDay(for date: Date) -> Date {
        let start = self.startOfDay(for: date)
        let components = DateComponents(day: 1, second: -1)
        guard let dateAtEnd = self.date(byAdding: components, to: start) else { return date }
        return dateAtEnd
    }

}

public extension TimeZone {

    static var daDK: TimeZone {
        let timeZone = TimeZone(identifier: "Europe/Copenhagen")!
        return timeZone
    }
}
