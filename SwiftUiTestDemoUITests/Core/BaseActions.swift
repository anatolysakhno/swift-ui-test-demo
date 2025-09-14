//
//  BaseAction.swift
//  SwiftUiTestDemo
//
//  Created by Anatoliy Sakhno on 12.09.2025.
//

class BaseActions<TApplication: BaseUiApplication, TScreen: BaseScreen<TApplication> >
{
    var screen: TScreen
    var app : TApplication
    init(app: TApplication, screen: TScreen) {
        self.screen = screen
        self.app = app
    }
}
