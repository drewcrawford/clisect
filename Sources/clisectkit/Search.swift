//Search.swift: Bisect searcher
// ©2020 DrewCrawfordApps LLC
private extension ClosedRange where Bound: FloatingPoint {
    var bisected: Bound {
        return (upperBound - lowerBound) / 2 + lowerBound
    }
}

enum IterationResult {
    case isLower
    case isUpper
}


struct Search {
    var range: ClosedRange<Double>
    var prompt: Double {
        return range.bisected
    }
    var difference: Double {
        return range.upperBound - range.lowerBound
    }
    mutating func apply(result: IterationResult) {
        switch result {
        case .isLower:
            range = prompt...range.upperBound
        case .isUpper:
            range = range.lowerBound...prompt
        }
    }
}
