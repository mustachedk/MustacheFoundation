import Foundation

infix operator +

public func +<Key, Value>(lhs: Dictionary<Key, Value>, rhs: Dictionary<Key, Value>) -> Dictionary<Key, Value> {
    var combined = rhs
    lhs.forEach { (key: Key, value: Value) in combined[key] = value }
    return combined
}

public extension Dictionary {

    func string(key: Key) -> String? {

        if let foundValue = self[key] as? String {
            return foundValue
        } else {
            for value in self.values {
                if let value = value as? [AnyHashable: Any], let result = value.string(key: key) {
                    return result
                }
            }
            return nil
        }
    }


    func int(key: Key) -> Int? {

        if let foundValue = self[key] as? Int {
            return foundValue
        } else {
            for value in self.values {
                if let value = value as? [AnyHashable: Any], let result = value.int(key: key) {
                    return result
                }
            }
            return nil
        }
    }
}
