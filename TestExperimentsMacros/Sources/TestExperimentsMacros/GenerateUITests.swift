//
//  File.swift
//  TestExperimentsMacros
//
//  Created by Marian Shkurda on 11.09.2025.
//


@attached(member, names: arbitrary)
public macro GenerateTestFunc(_ tests: [(String, [String: Any])]) = #externalMacro(
    module: "TestExperimentsMacrosMacros",
    type: "GenerateTestFuncMacro"
)
