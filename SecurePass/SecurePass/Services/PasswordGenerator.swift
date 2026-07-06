import Foundation

struct PasswordGenerator {
    static func generate(options: PasswordOptions) -> String {
        
        var characters = ""
        
        if options.useLowercase {
            characters += "abcdefghijklmnopqrstuvwxyz"
        }
        
        if options.useUppercase {
            characters += "ABCDEFGHIJKLMNOPQRSTUVWXYZ"
        }
        
        if options.useNumbers {
            characters += "0123456789"
        }
        
        if options.useSymbols {
            characters += "!@#$%^&*()_-+=<>?"
        }
        
        guard !characters.isEmpty else { return "" }
        
        let password = String(
            (0..<options.length).compactMap { _ in characters.randomElement()
            }
        )
        return password
    }
}
