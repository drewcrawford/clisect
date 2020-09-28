//InteractiveSearch.swift: Interactive searcher
// ©2020 DrewCrawfordApps LLC

enum IterationAction: CaseIterable {
    case applyToLower
    case applyToUpper
    case quit
    var shortcut: String {
        switch self {
        case .applyToLower: return "l"
        case .applyToUpper: return "u"
        case .quit: return "q"
        }
    }
    func menuDescription(difference: Double) -> String {
        switch self {
        case .applyToLower: return "apply to lower"
        case .applyToUpper: return "apply to upper"
        case .quit: return "quit (difference: \(difference))"
        }
    }
    static func menu(difference: Double) -> String {
        var s = ""
        for item in Self.allCases {
            s += "\(item.shortcut): \(item.menuDescription(difference: difference))"
            if item != Self.allCases.last {
                s += "\n"
            }
        }
        return s
    }
    
    init?(_ string: String) {
        for item in Self.allCases {
            if string == item.shortcut { self = item; return }
        }
        return nil
    }
}
struct CliSearch {
    var search: Search
    
    var promptString: String {
        return "\(search.prompt)"
    }
    
    mutating func apply(action: IterationAction) -> Bool {
        switch action {
        case .applyToLower: search.apply(result: .isLower)
        case .applyToUpper: search.apply(result: .isUpper)
        case .quit: return false
        }
        return true
    }
    
    private mutating func cliIteration() -> Bool {
        print("try: \(promptString)")
        print()
        print(IterationAction.menu(difference: search.difference))
        var nextAction: IterationAction? = nil
        while nextAction == nil {
            print(">",terminator:"")
            nextAction = IterationAction(readLine(strippingNewline: true) ?? "")
            if nextAction == nil {
                print(IterationAction.menu)
            }
        }
        return apply(action: nextAction!)
    }
    mutating func go() {
        while cliIteration() {}
        print("Final range: \(search.range)")
    }
}
