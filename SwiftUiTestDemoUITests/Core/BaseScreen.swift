//
//  BaseScreen.swift
//  SwiftUiTestDemo
//
//  Created by Anatoliy Sakhno on 12.09.2025.
//
enum ScreenError<TApplication: BaseUiApplication>: Error {
    case notImplemented
    case notOpen(screen: BaseScreen<TApplication>)
}

class BaseScreen<TApplication: BaseUiApplication>{
    var app : TApplication
    var trait: XCUIElement
    var timeout: TimeInterval
    /// default timeout to wait for screen to load
    static var SCREEN_TIMEOUT: TimeInterval {get { return 3}}
    /// default timeout to wait for element to be accessible
    static var ELEMENT_TIMEOUT: TimeInterval {get { return 1}}
    
    init(app: TApplication, trait: XCUIElement, timeout: TimeInterval = BaseScreen.SCREEN_TIMEOUT ) throws{
        self.app = app
        self.trait = trait
        self.timeout = timeout
        try self.validateScreen()
    }
    
    func validateScreen() throws {
        guard trait.waitForExistence(timeout: self.timeout) else {
            throw ScreenError.notOpen(screen: self)
        }
    }
    
    func activityName(_ description: String) -> String {
        "[\(type(of: self))] - \(description)"
    }
}
