import SwiftUI

struct ContentView: View {
    @State private var options = PasswordOptions()
    @State private var password = PasswordGenerator.generate(options: PasswordOptions()
    )
    
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
            }
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

