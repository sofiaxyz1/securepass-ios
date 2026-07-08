import SwiftUI
import UIKit

struct PasswordCard: View {
    let password: String
    
    @Binding var copied: Bool
    var body: some View {
        
        VStack(alignment: .leading, spacing: 12) {
            
            Text(password)
                .font(.system(.title3, design: .monospaced))
                .textSelection(.enabled)
            
            HStack {
                
                Spacer()
                
                Button {
                    UIPasteboard.general.string = password
                    copied = true
                    DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
                        copied = false
                    }
                } label: {
                    
                    Label(
                        copied ? "Copiado" : "Copiar",
                        systemImage: copied ? "checkmark.circle.fill" : "doc.on.doc"
                    )
                }
            }
        }
        .padding()
        .frame(maxWidth: .infinity, alignment: .leading)
        .background(.gray.opacity(0.12))
        .cornerRadius(16)
    }
}
