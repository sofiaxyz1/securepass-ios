import SwiftUI

struct ContentView: View {
    @State private var password = PasswordGenerator.generate()
    
    var body: some View {
        VStack(spacing: 20) {
            
        Text("🔐 SecurePass")
            .font(.largeTitle)
            .bold()
        
        Text(password)
            .font(.title2)
            .multilineTextAlignment(.center)
        
        Button("Gerar nova senha") {
            password = PasswordGenerator.generate()
        }
    }
    .padding()
  }
}

#Preview {
    ContentView()
}
