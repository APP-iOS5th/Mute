//
//  TodoWidgetBundle.swift
//  TodoWidget
//
//  Created by 김정우 on 4/25/24.
//

import WidgetKit
import SwiftUI

@main
struct TodoWidgetBundle: WidgetBundle {
    var body: some Widget {
        TodoWidget()
        TodoWidgetLiveActivity()
    }
}
