
import Foundation

extension Optional where Wrapped == String {

    public var orEmpty: String {
        switch self {
        case .none: return ""
        case .some(let value):return value
        }
    }
}

extension Optional {

    public var exists: Bool {
        switch self {
            case .none: return false
            case .some(_):return true
        }
    }
}
