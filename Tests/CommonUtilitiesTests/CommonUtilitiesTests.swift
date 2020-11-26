import XCTest
@testable import CommonUtilities

final class CommonUtilitiesTests: XCTestCase {
    func testExample() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct
        // results.
        XCTAssertEqual(CommonUtilities().text, "Hello, World!")
    }

    static var allTests = [
        ("testExample", testExample),
    ]
}
