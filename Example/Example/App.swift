//
//  SwiftUIExampleApp.swift
//  SwiftUIExample
//
//  Created by Tomoya Hirano on 2021/05/26.
//

import SwiftUI
import Logging
import DebugMenu
import DebugMenuConsolePlugin

@main
struct App: SwiftUI.App {
    init() {
        LoggingSystem.bootstrap({
            MultiplexLogHandler([
                StreamLogHandler.standardOutput(label: $0),
                WriteLogHandler.output(label: $0)
            ])
        })
        Logger(label: "dev.noppe.debugMenu.logger").info("Launch")
    }
    
    var body: some Scene {
        WindowGroup {
            Button(action: {
                let tracker = IntervalTracker(name: "dev.noppe.calc")
                tracker.track(.begin)
                let _ = (0..<10000000).reduce(0, +)
                tracker.track(.end)
            }, label: {
                Text("calculate")
            }).debugMenu(debuggerItems: [
                ConsoleDebugItem()
            ], complications: [])
        }
    }
}
