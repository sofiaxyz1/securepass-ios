import SwiftUI

struct ContentView: View {
    @State private var password = PasswordGenerator.generate(length: 16)
    @State private var passwordLength = 16.0
    
    var body: some View {
        VStack(spacing: 20) {
            
        Text("🔐 SecurePass")
            .font(.largeTitle)
            .bold()
        
        Text(password)
            .font(.title2)
            .multilineTextAlignment(.center)
            
            Text("Comprimento: \(Int(passwordLength))")
            
            Slider(
                value: $passwordLength,
                in: 8...32,
                step: 1
            )
        
        Button("Gerar nova senha") {
            password = PasswordGenerator.generate(length: Int(passwordLength))
        }
    }
    .padding()
  }
}

#Preview {
    ContentView()
}
