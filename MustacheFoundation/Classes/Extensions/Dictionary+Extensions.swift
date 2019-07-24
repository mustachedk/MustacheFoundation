import Foundation

extension Dictionary {

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
}
