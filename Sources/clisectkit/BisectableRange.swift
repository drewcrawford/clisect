//BisectableRange: Bisectable ClosedRange
// ©2020 DrewCrawfordApps LLC

import Foundation
protocol BisectableBound: Comparable, ExpressibleByIntegerLiteral {
    static func difference(_ range: ClosedRange<Self>) -> Self
    static func bisected(_ range: ClosedRange<Self>) -> Self
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
}
extension Double: BisectableBound {}
extension Float: BisectableBound {}
extension Int: BisectableBound {
    var nextUp: Int {
        self + 1
    }
    
    var nextDown: Int {
        self - 1
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
}


extension ClosedRange : BisectableRange where Bound: BisectableBound, Bound: CustomStringConvertible {
    var difference: Bound {
        Bound.difference(self)
    }
    var bisected: Bound {
        Bound.bisected(self)
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
