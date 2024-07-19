import SwiftUI

struct MenuBarView: View {
    @State private var selectedTab = 0
    @ObservedObject var clipboardManager: ClipboardManager
    @Binding var selectedText: String

    var body: some View {
        VStack {
            Picker(selection: $selectedTab, label: Text("")) {
                Text("Texts").tag(0)
                Text("Images").tag(1)
            }
            .pickerStyle(SegmentedPickerStyle())
            .padding()
            
            if selectedTab == 0 {
                TextListView(clipboardManager: clipboardManager)
            } else {
                ImagesListView()
            }
//            
//            ActionsView(clipboardManager: clipboardManager)
//                .padding()
        }
        .frame(width: 300) 
        .padding()
    }
}
//struct MenuBarView_Previews: PreviewProvider {
//    static var previews: some View {
//        MenuBarView(clipboardManager: ClipboardManager())
//    }
//}
