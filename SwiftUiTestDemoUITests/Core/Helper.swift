//
//  Helper.swift
//  SwiftUiTestDemoUITests
//
//  Created by Marian Shkurda on 15.09.2025.
//

import Foundation
import XCTest

func assertNoThrow<T>(_ expression: @autoclosure () throws -> T,
                      message: String) -> T {
    do {
        return try expression()
    } catch {
        let errorMessage = "\(message). Error: \(error)"
        XCTFail(errorMessage)
        fatalError(errorMessage)
    }
}

