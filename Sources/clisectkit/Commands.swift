
import ArgumentParser


struct Clisect: ParsableCommand {
    @Argument(help: "Range to bisect", transform: ClosedRange<Double>.init(parsing:))
    var range: ClosedRange<Double>
    
    func run() throws {
        var s = CliSearch(search: Search(range: range))
        s.go()
    }
    
}

public func main() {
    Clisect.main()
}
