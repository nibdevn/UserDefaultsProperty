import Foundation

extension UserDefaults {
    public func removeAll() {
        guard let identifier = Bundle.main.bundleIdentifier else { return }
        UserDefaults.standard.removePersistentDomain(forName: identifier)
        UserDefaults.standard.synchronize()
    }
}

@propertyWrapper
public struct UserDefaultsProperty<Element: Codable> {
    
    public init(wrappedValue: Element, key: String) {
        self.key = key
        self.defaultValue = wrappedValue
    }
    
    public init<Wrapped>(wrappedValue: Element = nil, key: String) where Element == Optional<Wrapped> {
        self.key = key
        self.defaultValue = wrappedValue
    }
    
    public let key: String
    public let defaultValue: Element
    public var wrappedValue: Element {
        get {
            getter()
        } set {
            setter(newValue)
        }
    }
    
    private func getter() -> Element {
        guard isPrimitiveType == false else {
            return UserDefaults.standard.object(forKey: key) as? Element ?? defaultValue
        }
        if let value = UserDefaults.standard.string(forKey: key) { return decode(value) }
        else { return defaultValue }
    }
    
    private func setter(_ newValue: Element) {
        guard isPrimitiveType == false else {
            UserDefaults.standard.set(newValue, forKey: key)
            UserDefaults.standard.synchronize()
            return
        }
        if let data = encode(value: newValue) { UserDefaults.standard.set(data, forKey: key) }
        else { UserDefaults.standard.removeObject(forKey: key) }
        UserDefaults.standard.synchronize()
    }
    
    private var isPrimitiveType: Bool {
        switch Element.self {
        case is Int.Type,
             is Float.Type,
             is Double.Type,
             is Bool.Type,
             is String.Type,
             is URL.Type,
             is Data.Type,
             is Date.Type:
            return true
        default:
            return false
        }
    }

    private func encode(value: Element) -> String? {
        do {
            let data = try JSONEncoder().encode(value)
            return String(data: data, encoding: .utf8)
        } catch {
            return nil
        }
    }

    private func decode(_ value: String) -> Element {
        guard let data = value.data(using: .utf8) else { return defaultValue }
        do {
            return try JSONDecoder().decode(Element.self, from: data)
        } catch {
            return defaultValue
        }
    }
    
    public mutating func set(_ setter: @escaping (inout Element) -> Void) {
        setter(&self.wrappedValue)
    }
}

