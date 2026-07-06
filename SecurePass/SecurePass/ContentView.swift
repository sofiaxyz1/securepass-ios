import SwiftUI
import UIKit

struct ContentView: View {
    @State private var options = PasswordOptions()
    @State private var password = PasswordGenerator.generate(options: PasswordOptions())
    @State private var history: [String] = []
    
    var body: some View {
        VStack(spacing: 20) {
            
            Text("🔐 SecurePass")
                .font(.largeTitle)
                .bold()
            
            Text(password)
                .font(.title2)
                .multilineTextAlignment(.center)
            
            Text("Comprimento: \(options.length)")
                .font(.headline)
            
            Slider(
                value: Binding(
                    get: {
                        Double(options.length)
                    },
                    set: {
                        options.length = Int($0)
                    }
                ),
                in: 8...32,
                step: 1
            )
            
            Toggle("Letras maiúsculas", isOn: $options.useUppercase)
            Toggle("Letras minúsculas", isOn: $options.useLowercase)
            Toggle("Números", isOn: $options.useNumbers)
            Toggle("Símbolos", isOn: $options.useSymbols)
            
            Button("Gerar nova senha") {
                password = PasswordGenerator.generate(options: options)
                
                history.insert(password, at: 0)
                
                if history.count > 10 {
                    history.removeLast()
                }
            }
            
            Button("📋 Copiar senha") {
                UIPasteboard.general.string = password
            }
            
            Divider()
                
            Text("Histórico:")
                    .font(.headline)
                
                ScrollView {
                    LazyVStack(alignment: .leading, spacing: 10) {
                        
                        ForEach(history, id: \.self) { password in
                            
                            Text(password)
                                .font(.system(.body, design: .monospaced))
                                .frame(maxWidth: .infinity, alignment: .leading)
                                .padding()
                                .background(.gray.opacity(0.15))
                                .cornerRadius(10)
                        }
                    }
                }
                .frame(maxHeight: 200)
            
        }
        .padding()
        .onChange(of: options) { _, _ in
            password = PasswordGenerator.generate(options: options)
        }
    }
}
    
    #Preview {
        ContentView()
    }

