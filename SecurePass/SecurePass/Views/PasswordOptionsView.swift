import SwiftUI

struct PasswordOptionsView: View {
    @Binding var options: PasswordOptions
    var body: some View {
        
        VStack(alignment: .leading, spacing: 16) {
            
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
            
            }
        }
}
