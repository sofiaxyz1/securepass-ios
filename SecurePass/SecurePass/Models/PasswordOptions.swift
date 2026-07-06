import Foundation

struct PasswordOptions: Equatable {
    var length: Int = 16
    var useUppercase = true
    var useLowercase = true
    var useNumbers = true
    var useSymbols = false
}

