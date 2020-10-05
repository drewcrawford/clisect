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
        assert(range.difference > 0,"Can't apply with 0 difference")
        switch result {
        case .isLower:
            range = Range(prompt.nextUp...range.upperBound)
        case .isUpper:
            range = Range(range.lowerBound...prompt.nextDown)
        }
    }
}
