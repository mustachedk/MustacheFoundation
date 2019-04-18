import Foundation

public struct Environment {

    public static var config: Configuration {
        let info = infoForKey("ENVIRONMENT_CONFIGURATION")
        let config = Configuration(rawValue: info)!
        return config
    }

    public static var backendURL: URL {
        let info = infoForKey("ENVIRONMENT_BACKEND_URL")
        let url = URL(string: info)!
        return url
    }

    public static var apiKey: String {
        let value = infoForKey("ENVIRONMENT_X_API_KEY")
        return value
    }

}

public func infoForKey(_ key: String) -> String {
    return (Bundle.main.infoDictionary![key] as! String).replacingOccurrences(of: "\\", with: "")
}

public enum Configuration: String {
    case development, alpha, beta, staging, release
}

public func pListValue<T>(_ key: String, name: String) -> T? {
    guard let plistPath = Bundle.main.path(forResource: name, ofType: "plist") else { return nil }
    guard let plistData = FileManager.default.contents(atPath: plistPath) else { return nil }
    var format = PropertyListSerialization.PropertyListFormat.xml
    guard let plistDict = try? PropertyListSerialization.propertyList(from: plistData,
                                                                      options: .mutableContainersAndLeaves,
                                                                      format: &format) as? [String: AnyObject] else { return nil }
    let myValue = plistDict[key] as? T
    return myValue
}
