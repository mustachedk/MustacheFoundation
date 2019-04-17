import Foundation

public extension UserDefaults {

    func archive<T: NSCoding>(object: T?, forKey key: String) {
        if let object = object {
            let archive = NSKeyedArchiver.archivedData(withRootObject: object) as NSData
            UserDefaults.standard.set(archive, forKey: key)
        } else {
            UserDefaults.standard.removeObject(forKey: key)
        }
    }

    func unarchive<T: NSCoding>(forKey key: String) -> T? {
        if let unarchivedObject = UserDefaults.standard.data(forKey: key) {
            return NSKeyedUnarchiver.unarchiveObject(with: unarchivedObject) as? T
        } else {
            return nil
        }
    }

    func archive<T: NSCoding>(object: [T], forKey key: String) {
        let archive = NSKeyedArchiver.archivedData(withRootObject: object as NSArray) as NSData
        UserDefaults.standard.set(archive, forKey: key)
    }

    func unarchive<T: NSCoding>(forKey key: String) -> [T] {
        if let unarchivedObject = UserDefaults.standard.data(forKey: key) {
            return NSKeyedUnarchiver.unarchiveObject(with: unarchivedObject) as? [T] ?? []
        } else {
            return []
        }
    }

    func decodeObject<T>(forKey defaultName: String) -> T? where T: Decodable {
        guard let saved = self.object(forKey: defaultName) as? Data else { return nil }
        let decoder = JSONDecoder()
        let loaded = try? decoder.decode(T.self, from: saved)
        return loaded
    }

    func encode<T>(_ value: T?, forKey defaultName: String) where T: Codable {
        let encoder = JSONEncoder()
        guard let value = value, let encoded = try? encoder.encode(value) else {
            self.removeObject(forKey: defaultName)
            return
        }
        self.set(encoded, forKey: defaultName)
    }

    func hasValue(forKey key: String) -> Bool {
        return nil != object(forKey: key)
    }
}
