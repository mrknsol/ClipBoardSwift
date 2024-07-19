import Cocoa
import SwiftUI

class AppDelegate: NSObject, NSApplicationDelegate {
    var statusBarItem: NSStatusItem!
    var popover: NSPopover!
    var clipboardManager = ClipboardManager()

    func applicationDidFinishLaunching(_ notification: Notification) {
        setupUI()
    }

    func setupUI() {
        statusBarItem = NSStatusBar.system.statusItem(withLength: NSStatusItem.variableLength)

        if let button = statusBarItem.button {
            button.image = NSImage(named: NSImage.Name("clipboard-list"))
            button.action = #selector(togglePopover(_:))
        }

        let contentView = ContentView()
            .environmentObject(clipboardManager)

        popover = NSPopover()
        popover.contentSize = NSSize(width: 600, height: 400)
        popover.behavior = .transient
        popover.contentViewController = NSHostingController(rootView: contentView)
        popover.contentViewController?.view.window?.makeKey()
    }

    @objc func togglePopover(_ sender: AnyObject?) {
        if let button = statusBarItem.button {
            if popover.isShown {
                closePopover()
            } else {
                popover.show(relativeTo: button.bounds, of: button, preferredEdge: NSRectEdge.minY)

                if let popoverWindow = popover.contentViewController?.view.window {
                    var origin = button.window!.convertToScreen(button.frame).origin
                    origin.x -= 290
                    popoverWindow.setFrameTopLeftPoint(origin)
                }
            }
        }
    }

    func closePopover() {
        popover.performClose(nil)
    }
}


