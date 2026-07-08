import SwiftUI
import UIKit

struct ContentView: View {
    @State private var options = PasswordOptions()
    @State private var password = PasswordGenerator.generate(options: PasswordOptions())
    @State private var history: [String] = []
    @State private var copied = false
    
    var body: some View {
        VStack(spacing: 20) {
            
            Text("🔐 SecurePass")
                .font(.largeTitle)
                .bold()
            
            PasswordCard(
                password: password,
                copied: $copied
            )
            
            StrengthView(password: password)
            
            PasswordOptionsView(
                options: $options
            )
            
            Button("Gerar nova senha") {
                password = PasswordGenerator.generate(options: options)
                
                history.insert(password, at: 0)
                
                if history.count > 10 {
                    history.removeLast()
                }
                
                HistoryStorage.save(history)
            }
            
            HistoryView(
                history: history,
                copied: $copied
            )
        }
        .padding()
        .onChange(of: options) { _, _ in
            password = PasswordGenerator.generate(options: options)
        }
        .onAppear {
            history = HistoryStorage.load()
        }
    }
}
        
#Preview {
    ContentView()
}
        

