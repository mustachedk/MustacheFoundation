
import Foundation

public extension DateFormatter {

    // swiftlint:disable identifier_name
    static let d: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateFormat = "d."
        return formatter
    }()
    // swiftlint:enable identifier_name

    static let dMMM: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateFormat = "d. MMM"
        return formatter
    }()

    static let dMMMYYYY: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateFormat = "d. MMM YYYY"
        return formatter
    }()

    static let yyyyMMddHHmmss: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd HH:mm:ss"
        return formatter
    }()

    static let yyyyMMdd: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd"
        return formatter
    }()
    
    static let yyyMMddTHHmmss: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss"
        return formatter
    }()

}
