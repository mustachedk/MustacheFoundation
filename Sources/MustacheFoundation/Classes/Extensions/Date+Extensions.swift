
import Foundation

let hoursMinutesFormat = "HH:mm"
let durationFormat = "dd/MM - HH:mm"
let receiptFormat = "dd/MM/yyyy - HH:mm"
let historyFormat = "dd.MMM.yyyy HH:mm"
let isoFormat1 = "yyyy-MM-dd'T'HH:mm:ss.SSS'Z'"
let isoFormat2 = "yyyy-MM-dd'T'HH:mm:ss'Z'"
let headerFormat = "E, dd MMM yyyy HH:mm:ss zzzz"

public extension String {

    func date(_ format: String, utc: Bool = true) -> Date? {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = format
        dateFormatter.timeZone = utc ? TimeZone(identifier: "UTC") : TimeZone.current
        return dateFormatter.date(from: self)
    }
}

public extension Date {

    func format(_ format: String, utc: Bool = true) -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = format
        dateFormatter.timeZone = utc ? TimeZone(identifier: "UTC") : TimeZone.current
        return dateFormatter.string(from: self)
    }
}

public extension Date {
    func dayNumberOfWeek() -> Int? {
        return Calendar.current.dateComponents([.weekday], from: self).weekday
    }
}

// extension Date: Strideable {
//
//     public func advanced(by n: Int) -> Date {
//         return Calendar.current.date(byAdding: .day, value: n, to: self) ?? self
//     }
// 
//     public func distance(to other: Date) -> Int {
//         return Calendar.current.dateComponents([.day], from: other, to: self).day ?? 0
//     }
// }
