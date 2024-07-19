import SwiftUI

struct ImagesListView: View {
    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 10) {
                ForEach(0..<5) { index in 
                    Image(systemName: "photo")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 100, height: 100)
                        .padding()
                        .background(Color.gray.opacity(0.2))
                        .cornerRadius(8)
                        .padding(.vertical, 5)
                }
            }
            .padding()
        }
    }
}

//struct ImagesListView_Previews: PreviewProvider {
//    static var previews: some View {
//        ImagesListView()
//    }
//}
