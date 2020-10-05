
import ArgumentParser


struct Clisect: ParsableCommand {
    @Argument(help: "Range to bisect", transform: AnyBisectableRange.init(parsing:))
    var range: AnyBisectableRange
    
    func run() throws {
        switch range {
        case .double(let range):
            var s = CliSearch(search: Search(range: range))
            s.go()
        }
    }
    
}

public func main() {
    Clisect.main()
}
