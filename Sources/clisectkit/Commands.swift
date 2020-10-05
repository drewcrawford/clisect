
import ArgumentParser
enum Errors: Error {
    case invalidType(String)
}
enum FormatType: ExpressibleByArgument,CaseIterable {
    init?(argument: String) {
        switch argument {
        case "double", "d": self = .double
        case "int","i": self = .int
        default: return nil
        }
    }
    
    
    case double
    case int
}


struct Clisect: ParsableCommand {
    @Argument(help: "Range to bisect")
    var range: String
    
    @Option(help: ArgumentHelp("The type to bisect", discussion: """
    d,double: range is in doubles
    i,int: range is an int
    """
    , valueName: "format"))
    var formatType: FormatType = .double
    
    func run() throws {
        switch formatType {
        case .double:
            let range = try ClosedRange<Double>(parsing: self.range)
            var s = CliSearch(search: Search(range: range))
            s.go()
        case .int:
            let range = try ClosedRange<Int>(parsing: self.range)
            var s = CliSearch(search: Search(range: range))
            s.go()
        }
    }
    
}

public func main() {
    Clisect.main()
}
