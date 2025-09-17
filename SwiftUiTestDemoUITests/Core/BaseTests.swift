//
//  BaseTest.swift
//  SwiftUiTestDemo
//
//  Created by Anatoliy Sakhno on 12.09.2025.
//

class BaseTests: ParametrizedTestCase {
    
    // Need to be overridden in subclasses
    class var testData: [(String, Any)] {
        []
    }
    
    override func setUpWithError() throws {
        continueAfterFailure = false
        XCUIDevice.shared.orientation = .portrait
    }
    
    // Need to be overridden in subclasses
    func runTest(_ testData: Any) throws {}
    
    override class func testMethodSelectors() -> [TestMethodSelectorWrapper] {
        return testData.map { (testName, testData) in
            let block: @convention(block) (Self) -> Void = { testClass in
                do {
                    try testClass.runTest(testData)
                } catch {
                    XCTFail("Unexpected error: \(error)")
                }
            }
            let implementation = imp_implementationWithBlock(block)
            let testDataString = String("\(testData)".prefix(100))
            let selectorName = "test_\(testName)_\(testDataString)"
            let selector = NSSelectorFromString(selectorName)
            class_addMethod(self, selector, implementation, "v@:")
            return TestMethodSelectorWrapper(selector: selector)
        }
    }
}
