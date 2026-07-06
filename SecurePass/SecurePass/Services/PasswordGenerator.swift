import Foundation

struct PasswordGenerator {
    static func generate(length: Int) -> String {
        let characters = "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789"
        
        let password = String(
            (0..<length).compactMap { _ in
                characters.randomElement()
            }
        )
        return password
    }
}

