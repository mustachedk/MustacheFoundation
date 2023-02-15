
import Foundation

public extension JSONDecoder {

    static let yyyyMMddHHmmss: JSONDecoder = {
        let decoder = JSONDecoder()
        decoder.dateDecodingStrategy = .formatted(DateFormatter.yyyyMMddHHmmss)
        return decoder
    }()

    static let yyyyMMdd: JSONDecoder = {
        let decoder = JSONDecoder()
        decoder.dateDecodingStrategy = .formatted(DateFormatter.yyyyMMdd)
        return decoder
    }()
    
    static let yyyyMMddTHHmmss: JSONDecoder = {
        let decoder = JSONDecoder()
        decoder.dateDecodingStrategy = .formatted(DateFormatter.yyyMMddTHHmmss)
        return decoder
    }()
    
}
