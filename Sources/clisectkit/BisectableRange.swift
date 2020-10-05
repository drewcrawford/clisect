//BisectableRange: Bisectable ClosedRange
// ©2020 DrewCrawfordApps LLC

import Foundation
protocol BisectableBound: Comparable, ExpressibleByIntegerLiteral {
    static func difference(_ range: ClosedRange<Self>) -> Self
    static func bisected(_ range: ClosedRange<Self>) -> Self
    static func isConsecutive(_ range: ClosedRange<Self>) -> Bool
    var nextUp: Self { get }
    var nextDown: Self { get }
}
extension FloatingPoint {
    static func difference(_ range: ClosedRange<Self>) -> Self {
        return range.upperBound - range.lowerBound
    }
    static func bisected(_ range: ClosedRange<Self>) -> Self {
        return (range.upperBound - range.lowerBound) / 2 + range.lowerBound
    }
    static func isConsecutive(_ range: ClosedRange<Self>) -> Bool {
        return range.lowerBound.nextUp == range.upperBound
    }
}
extension Float: BisectableBound {}
extension Double: BisectableBound {}
extension Int: BisectableBound {
    var nextUp: Int {
        self + 1
    }
    var nextDown: Int {
        self - 1
    }
    static func isConsecutive(_ range: ClosedRange<Int>) -> Bool {
        range.lowerBound + 1 == range.upperBound
    }
    
    static func difference(_ range: ClosedRange<Int>) -> Int {
        range.upperBound - range.lowerBound
    }
    
    static func bisected(_ range: ClosedRange<Int>) -> Int {
        (range.upperBound - range.lowerBound) / 2 + range.lowerBound
    }
}


protocol BisectableRange: Equatable {
    associatedtype Bound: CustomStringConvertible, BisectableBound
    var bisected: Bound { get }
    var difference: Bound { get }
    init(_ range: ClosedRange<Bound>)
    var upperBound: Bound { get }
    var lowerBound: Bound { get }
    var isConsecutive: Bool { get }
}



extension ClosedRange : BisectableRange where Bound: BisectableBound, Bound: CustomStringConvertible {
    var difference: Bound {
        Bound.difference(self)
    }
    var bisected: Bound {
        Bound.bisected(self)
    }
    var isConsecutive: Bool {
        Bound.isConsecutive(self)
    }
    
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
