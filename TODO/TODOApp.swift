//
//  TODOApp.swift
//  TODO
//
//  Created by Manyuchi, Carrington C on 2025/04/04.
//
/// MVVM Architecture:
///     Model: - data point
///     View - UI
///     ViewModel -manages Models for View
///

import SwiftUI

@main
struct TODOApp: App {
    var body: some Scene {
        WindowGroup {
            NavigationStack {
                ListView()
            }
        }
    }
}
