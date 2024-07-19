import Foundation
import Combine
import AppKit

class ClipboardManager: ObservableObject {
    @Published var items: [ClipBoardItem] = []
    @Published var selectedItem: ClipBoardItem?
    private var timer: Timer?

    init() {
        startMonitoringClipboard()
    }

    func addClipboardItem(content: String) {
        let newItem = ClipBoardItem(content: content, date: Date())
        items.append(newItem)
    }

    private func startMonitoringClipboard() {
        timer = Timer.scheduledTimer(withTimeInterval: 1.0, repeats: true) { _ in
            self.checkClipboard()
        }
    }

    private func checkClipboard() {
        if let copiedString = NSPasteboard.general.string(forType: .string) {
            if !items.contains(where: { $0.content == copiedString }) {
                addClipboardItem(content: copiedString)
            }
        }
    }

    func selectItem(_ item: ClipBoardItem) {
        if selectedItem?.id == item.id {
            selectedItem = nil
        } else {
            selectedItem = item
        }
    }

    func pasteItem(_ item: ClipBoardItem) {
            let pasteboard = NSPasteboard.general
            pasteboard.clearContents()
            pasteboard.setString(item.content, forType: .string)

            let src = CGEventSource(stateID: .hidSystemState)

            let keyVDown = CGEvent(keyboardEventSource: src, virtualKey: 0x09, keyDown: true)
            let keyVUp = CGEvent(keyboardEventSource: src, virtualKey: 0x09, keyDown: false)

            keyVDown?.flags = .maskCommand
            keyVUp?.flags = .maskCommand

            keyVDown?.post(tap: .cgAnnotatedSessionEventTap)
            keyVUp?.post(tap: .cgAnnotatedSessionEventTap)
        }

    deinit {
        timer?.invalidate()
    }
}

