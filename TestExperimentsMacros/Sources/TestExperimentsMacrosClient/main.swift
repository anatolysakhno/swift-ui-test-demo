import TestExperimentsMacros

@GenerateTestFunc([
    ("validTest1", ["param1": "A"]),
    ("validTest2", ["param1": "B"]),
    ("inValidTest1", ["param1": "XXX"])
])
final class GeneratedTests {

    func runTest(params: [String: Any]) {
        print("ℹ️ params: \(params)")
    }
}

let generatedTest = GeneratedTests()
generatedTest.test_validTest1()
generatedTest.test_validTest2()
generatedTest.test_inValidTest1()
