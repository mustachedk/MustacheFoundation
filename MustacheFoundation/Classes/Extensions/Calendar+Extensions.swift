
import Foundation

public extension Calendar {

    func endOfDay(for date: Date) -> Date {
        let start = self.startOfDay(for: date)
        let components = DateComponents(day: 1, second: -1)
        guard let dateAtEnd = self.date(byAdding: components, to: start) else { return date }
        return dateAtEnd
    }

}
