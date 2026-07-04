import SwiftUI

struct ContentView: View {

    var body: some View {

        VStack(spacing: 20) {

            Text("🔐 SecurePass")
                .font(.largeTitle)
                .bold()

            Text(PasswordGenerator.generate())
                .font(.title2)
                .multilineTextAlignment(.center)

        }
        .padding()
    }
}

#Preview {
    ContentView()
}
