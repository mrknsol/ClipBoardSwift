import SwiftUI

struct SettingsView: View {
    @AppStorage("maxItems") private var maxItems: Int = 50
    @AppStorage("autoDeleteOldItems") private var autoDeleteOldItems: Bool = false
    @AppStorage("fontSize") private var fontSize: Double = 14.0
    
    var body: some View {
        TabView {
            GeneralSettingsView(maxItems: $maxItems, autoDeleteOldItems: $autoDeleteOldItems, fontSize: $fontSize)
                .tabItem {
                    Label("General", systemImage: "gear")
                }
            ShortcutsSettingsView()
                .tabItem {
                    Label("Shortcuts", systemImage: "keyboard")
                }
            OtherSettingsView()
                .tabItem {
                    Label("Other", systemImage: "keyboard")
                }
        }
        .padding()
        .frame(width: 400, height: 300)
    }
}

struct GeneralSettingsView: View {
    @Binding var maxItems: Int
    @Binding var autoDeleteOldItems: Bool
    @Binding var fontSize: Double
    
    var body: some View {
        Form {
            Section(header: Text("Clipboard Settings")) {
                Stepper(value: $maxItems, in: 1...100) {
                    Text("Max items: \(maxItems)")
                }

                Toggle("Auto-delete old items", isOn: $autoDeleteOldItems)

                Slider(value: $fontSize, in: 10...30, step: 1) {
                    Text("Font Size: \(Int(fontSize))")
                }
            }
        }
        .padding()
    }
}

struct ShortcutsSettingsView: View {
    @AppStorage("shortcutPaste") private var shortcutPaste: String = "⌘V"
    
    var body: some View {
        Form {
            Section(header: Text("Shortcuts")) {
                TextField("Paste Shortcut", text: $shortcutPaste)
            }
        }
        .padding()
    }
}

struct OtherSettingsView: View {
    @AppStorage("shortcutPaste") private var shortcutPaste: String = "⌘V"
    
    var body: some View {
        Form {
            Section(header: Text("Shortcuts")) {
                TextField("Paste Shortcut", text: $shortcutPaste)
            }
        }
        .padding()
    }
}
