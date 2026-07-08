import SwiftUI
import UIKit

struct HistoryView: View {
    let history: [String]
    
    @Binding var copied: Bool
    var body: some View {
        
        VStack(alignment: .leading) {
            
            Divider()
            
            Text("Histórico")
                .font(.headline)
            
            ScrollView {
                
                LazyVStack(alignment: .leading, spacing: 10) {
                    ForEach(history, id: \.self) { savedPassword in
                  
                        Button {
                            UIPasteboard.general.string = savedPassword
                            copied = true
                            DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
                            copied = false
                            }
                            
                        } label: {
                            
                            HStack {
                                
                                Text(savedPassword)
                                    .font(.system(.body, design: .monospaced))
                                    .lineLimit(1)
                                    .truncationMode(.middle)
                                
                                Spacer()
                                
                                Image(systemName: "doc.on.doc")
                            }
                            .padding()
                            .frame(maxWidth: .infinity)
                            .background(.gray.opacity(0.15))
                            .cornerRadius(10)
                        }
                    }
                }
            }
            .frame(maxHeight: 220)
        }
    }
}
