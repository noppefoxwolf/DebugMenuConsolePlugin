//
//  ConsoleDebugItem.swift
//  DebugMenu
//
//  Created by Tomoya Hirano on 2021/02/25.
//

import DebugMenu

public struct ConsoleDebugItem: DebugItem {
    public var debugItemTitle: String { "Console" }
    public let action: DebugItemAction = .didSelect { (controller, completions) in
        let vc = LogsViewController()
        controller.navigationController?.pushViewController(vc, animated: true)
        completions(.success())
    }
    public init() {}
}
