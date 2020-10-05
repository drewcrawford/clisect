//Search.swift: Bisect searcher
// ©2020 DrewCrawfordApps LLC


enum IterationResult {
    case isLower
    case isUpper
}


struct Search<Range> where Range: BisectableRange {
    var range: Range
    var prompt: Range.Bound {
        return range.bisected
    }
    var difference: Range.Bound {
        return range.difference
    }
    mutating func apply(result: IterationResult) {
        switch result {
        case .isLower:
            if prompt == range.lowerBound {
                self.range = Range(range.upperBound...range.upperBound)
            }
            else {
                self.range = Range(prompt...range.upperBound)
            }
        case .isUpper:
            if prompt == range.upperBound {
                self.range = Range(range.lowerBound...range.lowerBound)
            }
            else {
                self.range = Range(range.lowerBound...prompt)
            }
        }
    }
}
