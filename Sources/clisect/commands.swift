
import ArgumentParser
import clisectkit


struct Clisect: ParsableCommand {
    @Argument(help: "Range to bisect", transform: ClosedRange<Double>.init(parsing:))
    var range: ClosedRange<Double>
    
    func run() throws {
        print("Bisecting \(range)")
    }
    
}
