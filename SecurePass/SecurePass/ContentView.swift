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
            
            Text("Força: \(PasswordStrength.evaluate(password))")
                .font(.headline)
            
            ProgressView(value: Double(PasswordStrength.score(password)),
                         total: 5)
            .tint(PasswordStrength.color(password))
            .animation(.easeInOut(duration: 0.4), value: password)
            
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
            
            Divider()
            
            Text("Histórico:")
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
                                    .lineLimit(2)
                                    .multilineTextAlignment(.leading)
                                    .frame(maxWidth: .infinity, alignment: .leading)
                                
                                Spacer()
                                
                                Image(systemName: "doc.on.doc")
                            }
                            .frame(maxWidth: .infinity, alignment: .leading)
                            .padding()
                            .background(.gray.opacity(0.15))
                            .cornerRadius(10)
                        }
                    }
                }
            }
            .padding()
            .onChange(of: options) { _, _ in
                password = PasswordGenerator.generate(options: options)
            }
        }
    }
}
    #Preview {
        ContentView()
    }
