import Foundation

struct PasswordGenerator {
    static func generate() -> String {
        let characters = "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789"
        
        let password = String(
            (0..<16).compactMap { _ in
                characters.randomElement()
            }
        )
        return password
    }
}

