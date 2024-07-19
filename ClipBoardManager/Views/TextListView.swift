import SwiftUI

struct TextListView: View {
    @ObservedObject var clipboardManager: ClipboardManager
    @State private var selectedItem: ClipBoardItem? = nil
    @State private var expandedItems: Set<UUID> = []
    
    var body: some View {
        List(clipboardManager.items) { item in
            VStack(alignment: .leading) {
                if expandedItems.contains(item.id) {
                    Text(item.content)
                    Button("Show less") {
                        expandedItems.remove(item.id)
                    }
                } else {
                    Text(item.content.prefix(100) + (item.content.count > 100 ? "..." : ""))
                    if item.content.count > 100 {
                        Button("Show full") {
                            expandedItems.insert(item.id)
                        }
                    }
                }
                Text(item.date, style: .time)
                    .font(.footnote)
                    .foregroundColor(.gray)
            }
            .padding()
            .background(selectedItem == item ? Color.blue.opacity(0.3) : Color.clear)
            .onTapGesture {
                selectedItem = item
                clipboardManager.pasteItem(item)
            }
        }
    }
}

    //
    //struct TextsListView_Previews: PreviewProvider {
    //    static var previews: some View {
    //        TextsListView()
    //    }
    //}


