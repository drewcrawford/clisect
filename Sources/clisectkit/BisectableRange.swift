//BisectableRange: Bisectable ClosedRange
// ©2020 DrewCrawfordApps LLC

import Foundation
extension ClosedRange where Bound: AdditiveArithmetic {
    var difference: Bound {
        return upperBound - lowerBound
    }
}
extension ClosedRange where Bound: FloatingPoint {
    var bisected: Bound {
        (upperBound - lowerBound) / 2 + lowerBound
    }
}

protocol BisectableRange {
    associatedtype Bound: CustomStringConvertible, Comparable
    var bisected: Bound { get }
    var difference: Bound { get }
    init(_ range: ClosedRange<Bound>)
    var upperBound: Bound { get }
    var lowerBound: Bound { get }
}


extension ClosedRange : BisectableRange where Bound: FloatingPoint, Bound: CustomStringConvertible {
    init(_ range: ClosedRange<Bound>) {
        self = range
    }
}


enum AnyBisectableRange {
    case double(ClosedRange<Double>)
    
    init(parsing: String) throws {
        self = .double(try ClosedRange<Double>(parsing: parsing))
    }
}
