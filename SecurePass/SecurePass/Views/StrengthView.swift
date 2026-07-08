import SwiftUI

struct StrengthView: View {
    let password: String
    
    var body: some View {
        
        VStack(alignment: .leading, spacing: 8) {
            
            Text("Força: \(PasswordStrength.evaluate(password))")
                .font(.headline)
            
            ProgressView(
                value: Double(PasswordStrength.score(password)),
                total: 5
            )
            .tint(PasswordStrength.color(password))
            .animation(.easeInOut(duration: 0.4), value: password)
        }
    }
}
