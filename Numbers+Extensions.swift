import Foundation

public extension Double {

    var int: Int { return Int(self) }

    var cgfloat: CGFloat { return CGFloat(self) }

    var float: Float { return Float(self) }

    var number: NSNumber { return NSNumber(value: self) }

    func format(format: String) -> String {
        return String(format: "%\(format)f", self)
    }
}

public extension Int {

    var odd: Bool { return self % 2 != 0 }

    var even: Bool { return !odd }

    var double: Double { return Double(self) }

    var cgfloat: CGFloat { return CGFloat(self) }

    var float: Float { return Float(self) }

    var uint: UInt { return UInt(self) }

    var number: NSNumber { return NSNumber(value: self) }

    func format(format: String) -> String {
        return String(format: "%\(format)d", self)
    }

    public var string: String { return "\(self)" }
}

public extension UInt {

    var int: Int { return Int(self) }

    var float: Float { return Float(self) }

    var number: NSNumber { return NSNumber(value: self) }

    var string: String { return "\(self)" }
}

public extension Float {

    var double: Double { return Double(self) }

    var cgfloat: CGFloat { return CGFloat(self) }

    var uint: UInt { return UInt(self) }

    var number: NSNumber { return NSNumber(value: self) }

    var string: String { return "\(self)" }
}

infix operator &=

public func &=(lhs: inout Bool, rhs: Bool) {
    lhs = lhs && rhs
}
