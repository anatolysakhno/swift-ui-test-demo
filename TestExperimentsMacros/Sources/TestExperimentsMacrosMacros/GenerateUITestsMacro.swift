//
//  File.swift
//  TestExperimentsMacros
//
//  Created by Marian Shkurda on 11.09.2025.
//
import Foundation
import SwiftSyntax
import SwiftSyntaxMacros
import SwiftCompilerPlugin

@main
struct TestExperimentsPlugin: CompilerPlugin {
    let providingMacros: [Macro.Type] = [
        GenerateTestFuncMacro.self
    ]
}

public struct GenerateTestFuncMacro: MemberMacro {
    public static func expansion(
        of node: AttributeSyntax,
        providingMembersOf decl: some DeclGroupSyntax,
        in context: some MacroExpansionContext
    ) throws -> [DeclSyntax] {

        // 1️⃣ Extract the array expression from the attribute
        guard
            let args = node.arguments?.as(LabeledExprListSyntax.self),
            let arrayExpr = args.first?.expression.as(ArrayExprSyntax.self)
        else {
            throw MacroExpansionErrorMessage("Expected an array of tuples")
        }

        var generatedFunctions: [DeclSyntax] = []

        // 2️⃣ Iterate over array elements
        for arrayElement in arrayExpr.elements {
            guard let tupleExpr = arrayElement.expression.as(TupleExprSyntax.self) else {
                continue // skip non-tuple elements
            }
            let list = tupleExpr.elements
            // 3️⃣ Extract tuple parts
            guard list.count == 2 else {
                continue // skip malformed tuples
            }
            let firstIndex = list.startIndex
            let secondIndex = list.index(after: firstIndex)
            
            // First element: test name
            guard let nameLiteral = list[firstIndex].expression.as(StringLiteralExprSyntax.self),
                  var testName = nameLiteral.segments.first?.description.trimmingCharacters(in: .whitespacesAndNewlines)
            else {
                continue
            }
            testName = "test_\(testName)"
            // Second element: dictionary literal
            guard let dictExpr = list[secondIndex].expression.as(DictionaryExprSyntax.self) else {
                continue
            }

            var keyValuePairs: [String] = []
            if case let .elements(elements) = dictExpr.content {
                for element in elements {
                    let keySource = element.key.description.trimmingCharacters(in: .whitespacesAndNewlines)
                    let valueSource = element.value.description.trimmingCharacters(in: .whitespacesAndNewlines)
                    keyValuePairs.append("\(keySource): \(valueSource)")
                }
            }

            let dictLiteral = "[\(keyValuePairs.joined(separator: ", "))]"

            // 4️⃣ Generate a function for this test
            let funcDecl: DeclSyntax = """
            func \(raw: testName)() {
                runTest(params: \(raw: dictLiteral))
            }
            """

            generatedFunctions.append(funcDecl)
        }

        return generatedFunctions
    }
}
