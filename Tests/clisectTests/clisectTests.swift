import XCTest
import class Foundation.Bundle

final class clisectTests: XCTestCase {
    func testSearch() throws {

        let fooBinary = productsDirectory.appendingPathComponent("clisect")

        let process = Process()
        process.executableURL = fooBinary
        process.arguments = ["0...100"]
        
        let inputPipe = Pipe()
        let pipe = Pipe()
        process.standardOutput = pipe
        process.standardInput = inputPipe

        try process.run()
        inputPipe.fileHandleForWriting.write("l\n".data(using: .utf8)!) //50...100
        inputPipe.fileHandleForWriting.write("u\n".data(using: .utf8)!) //50...75
        inputPipe.fileHandleForWriting.write("q\n".data(using: .utf8)!)

        process.waitUntilExit()

        let data = pipe.fileHandleForReading.readDataToEndOfFile()
        let output = String(data: data, encoding: .utf8)
        //we expect 3 prompts
        let prompts = try XCTUnwrap(output?.components(separatedBy: "try: "))
        XCTAssertEqual(prompts.count, 4)
        XCTAssert(prompts.last?.hasPrefix("62.5") ?? false)
        XCTAssertEqual(process.terminationStatus,0)
    }
    
    func testSearchInt() throws {
        let fooBinary = productsDirectory.appendingPathComponent("clisect")

        let process = Process()
        process.executableURL = fooBinary
        process.arguments = ["10...15","--format-type","i"]
        
        let inputPipe = Pipe()
        let pipe = Pipe()
        process.standardOutput = pipe
        process.standardInput = inputPipe

        try process.run()
        //try: 12
        inputPipe.fileHandleForWriting.write("l\n".data(using: .utf8)!) //13...15
        //try: 14
        inputPipe.fileHandleForWriting.write("u\n".data(using: .utf8)!) //13...13

        process.waitUntilExit()

        let data = pipe.fileHandleForReading.readDataToEndOfFile()
        let output = String(data: data, encoding: .utf8)
        //we expect 2 prompts
        let prompts = try XCTUnwrap(output?.components(separatedBy: "try: "))
        XCTAssertEqual(prompts.count, 3)
        XCTAssert(prompts.last?.hasPrefix("14") ?? false)
        XCTAssertEqual(process.terminationStatus,0)
    }

    /// Returns path to the built products directory.
    var productsDirectory: URL {
      #if os(macOS)
        for bundle in Bundle.allBundles where bundle.bundlePath.hasSuffix(".xctest") {
            return bundle.bundleURL.deletingLastPathComponent()
        }
        fatalError("couldn't find the products directory")
      #else
        return Bundle.main.bundleURL
      #endif
    }

    static var allTests = [
        ("testSearch", testSearch),
    ]
}
