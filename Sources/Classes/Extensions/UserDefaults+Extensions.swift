import Foundation

public extension UserDefaults {

    func archive<T: NSCoding>(object: T?, forKey key: String) {
        if let object = object {
            let archive = NSKeyedArchiver.archivedData(withRootObject: object) as NSData
            self.set(archive, forKey: key)
        } else {
            self.removeObject(forKey: key)
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
        self.set(archive, forKey: key)
    }

    func unarchive<T: NSCoding>(forKey key: String) -> [T] {
        if let unarchivedObject = self.data(forKey: key) {
            return NSKeyedUnarchiver.unarchiveObject(with: unarchivedObject) as? [T] ?? []
        } else {
            return []
        }
    }

    func decodeObject<T>(forKey key: String) -> T? where T: Decodable {
        guard let saved = self.data(forKey: key) as? Data else { return nil }
        let decoder = JSONDecoder()
        let loaded = try? decoder.decode(T.self, from: saved)
        return loaded
    }

    func encode<T>(_ value: T?, forKey key: String) where T: Encodable {
        
        let string = "\(UserDefaults.didChangeNotification.rawValue)-\(key)"
        let name = NSNotification.Name(rawValue: string)
        
        let encoder = JSONEncoder()
        guard let value = value, let encoded = try? encoder.encode(value) else {
            self.removeObject(forKey: key)
            NotificationCenter.default.post(name: name, object: nil)
            return
        }
        self.set(encoded, forKey: key)
        NotificationCenter.default.post(name: name, object: nil)
    }

    func hasValue(forKey key: String) -> Bool {
        return nil != object(forKey: key)
    }
}
