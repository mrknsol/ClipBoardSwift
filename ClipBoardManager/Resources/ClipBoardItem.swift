//
//  ClipBoardItem.swift
//  ClipBoardManager
//
//  Created by mrknsol on 7/8/24.
//

import Foundation
import SwiftUI

//enum ClipBoardContent {
//    case text (String)
//    case image (NSImage)
//}
class ClipBoardItem: Identifiable, Equatable {
    let id = UUID()
    let content: String
    let date: Date

    init(content: String, date: Date) {
        self.content = content
        self.date = date
    }

    static func == (lhs: ClipBoardItem, rhs: ClipBoardItem) -> Bool {
        return lhs.id == rhs.id
    }
}
