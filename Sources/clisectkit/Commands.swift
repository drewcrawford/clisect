
import ArgumentParser
enum Errors: Error {
    case invalidType(String)
}
enum FormatType {
    init(argument: String) throws {
        switch argument {
        case "double", "d": self = .double
        case "int","i": self = .int
        default: throw Errors.invalidType(argument)
        }
    }
    
    case double
    case int
}


struct Clisect: ParsableCommand {
    @Argument(help: "Range to bisect")
    var range: String
    
    @Option(transform: FormatType.init)
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
