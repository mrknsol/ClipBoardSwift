import SwiftUI

struct ContentView: View {
    @StateObject var clipboardManager = ClipboardManager()
    @State private var settingsWindow: NSWindow?
    
    var body: some View {
            VStack {
            TabView {
                TextListView(clipboardManager: clipboardManager)
                    .tabItem {
                        Label("Text", systemImage: "text.bubble")
                    }
                ImageView()
                    .tabItem {
                        Label("Images", systemImage: "photo")
                    }
            }
            .frame(width: 400, height: 450)
            
            HStack {
                Button("Preferences") {
                   openSettingsWindow()
                }
                Spacer()
                Button("Quit") {
                    NSApplication.shared.terminate(nil)
                }
            }
            .padding()
        }
        
        
    }
    private func openSettingsWindow() {
            if settingsWindow == nil {
                let settingsWindowController = SettingsWindowController()
                settingsWindow = settingsWindowController.window
            }
            settingsWindow?.makeKeyAndOrderFront(nil)
        }
}

struct ImageView: View {
    var body: some View {
        Text("Copied Images")
    }
}


