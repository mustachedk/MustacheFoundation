import Foundation

public extension Substring {
    var intValue: Int? { return Int(String(self)) }
    var string: String { return String(self) }
}

public extension String {

    func capitalizingFirstLetter() -> String {
        let first = String(self.prefix(1)).capitalized
        let other = String(self.dropFirst())
        return first + other
    }

    mutating func capitalizeFirstLetter() {
        self = self.capitalizingFirstLetter()
    }
}

public extension String {

    var localized: String { return NSLocalizedString(self, comment: "") }

    var gif: Data {
        if let path = Bundle.main.path(forResource: self, ofType: "gif") {
            let url = URL(fileURLWithPath: path)
            return (try? Data(contentsOf: url)) ?? Data()
        }
        return Data()
    }

    var urlEscaped: String { return addingPercentEncoding(withAllowedCharacters: .urlHostAllowed)! }

    var utf8Encoded: Data { return data(using: .utf8)! }

    subscript(bounds: CountableClosedRange<Int>) -> String {
        let start = index(startIndex, offsetBy: bounds.lowerBound)
        let end = index(startIndex, offsetBy: bounds.upperBound)
        return String(self[start...end])
    }

    subscript(bounds: CountableRange<Int>) -> String {
        let start = index(startIndex, offsetBy: bounds.lowerBound)
        let end = index(startIndex, offsetBy: bounds.upperBound)
        return String(self[start..<end])
    }

    subscript(bounds: PartialRangeUpTo<Int>) -> String {
        let end = index(startIndex, offsetBy: bounds.upperBound)
        return String(self[startIndex..<end])
    }

    subscript(bounds: PartialRangeThrough<Int>) -> String {
        let end = index(startIndex, offsetBy: bounds.upperBound)
        return String(self[startIndex...end])
    }

    subscript(bounds: CountablePartialRangeFrom<Int>) -> String {
        let start = index(startIndex, offsetBy: bounds.lowerBound)
        return String(self[start..<endIndex])
    }
}




