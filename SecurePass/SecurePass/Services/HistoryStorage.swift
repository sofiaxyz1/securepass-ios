import Foundation

struct HistoryStorage {
    private static let key = "password_history"
    
    static func save(_ history: [String]) {
        UserDefaults.standard.set(history, forKey: key)
    }
    
    static func load() -> [String] {
        return UserDefaults.standard.stringArray(forKey: key) ?? []
    }
}
