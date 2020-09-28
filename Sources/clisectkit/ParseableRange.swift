//ParseableRange.swift: Parseable range
// ©2020 DrewCrawfordApps LLC
import Foundation
enum RangeParseError: Error {
    case noElipsis(String)
    case parseError(String)
    case rangeOrderingError(String,String)
}

protocol StringParseable {
    init?<S>(_ text: S) where S : StringProtocol
}

extension Double: StringParseable {}



extension ClosedRange where Bound: FloatingPoint, Bound: StringParseable {
    init(parsing string: String) throws {
        let separated = string.components(separatedBy: "...")
        if separated.isEmpty {
            throw RangeParseError.noElipsis(string)
        }
        if separated.count != 2 {
            throw RangeParseError.parseError(string)
        }
        guard let lower = Bound(separated[0]) else {
            throw RangeParseError.parseError(string)
        }
        guard let upper = Bound(separated[1]) else {
            throw RangeParseError.parseError(string)
        }
        
        guard lower < upper else {
            throw RangeParseError.rangeOrderingError(separated[0],separated[1])
        }

        self.init(uncheckedBounds: (lower,upper))
    }
}
