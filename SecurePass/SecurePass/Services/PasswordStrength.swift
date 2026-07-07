import Foundation
import SwiftUI

struct PasswordStrength {
    static func evaluate(_ password: String) -> String {
        
        switch score(password) {
        case 0...1:
            return "Muito fraca"
        case 2:
            return "Fraca"
        case 3...4:
            return "Boa"
        default:
            return "Forte"
        }
    }
    
    static func score(_ password: String) -> Int {
        var score = 0
        
        //Tamanho da senha
        if password.count >= 8 {
            score += 1
        }
        
        //Letras minúsculas
        if password.contains(where: { $0.isLowercase}) {
            score += 1
        }
        
        //Letras maiuscúlas
        if password.contains(where: { $0.isUppercase}) {
            score += 1
        }
            
        //Números
        if password.contains(where: { $0.isNumber}) {
            score += 1
        }
            
        //Símbolos
        let symbols = "!@#$%^&*()_-+=<>?"
        if password.contains(where: {symbols.contains($0) }) {
            score += 1
        }
            return score
        }
    
    static func color (_ password: String) -> Color {
        
        switch score(password) {
        case 1:
            return .red
        case 2:
            return .orange
        case 3:
            return .yellow
        default:
            return .green
        }
    }
}

