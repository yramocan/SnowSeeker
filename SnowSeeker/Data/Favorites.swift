import Foundation

class Favorites: ObservableObject {
    private var resorts: Set<Resort>
    private let saveKey = "Favorites"

    init() {
        guard
            let data = UserDefaults.standard.data(forKey: saveKey),
            let resorts = try? JSONDecoder().decode(Set<Resort>.self, from: data)
        else {
            self.resorts = []
            return
        }

        self.resorts = resorts
    }

    func contains(_ resort: Resort) -> Bool {
        resorts.contains(resort)
    }

    func add(_ resort: Resort) throws {
        objectWillChange.send()
        resorts.insert(resort)
        try save()
    }

    func remove(_ resort: Resort) throws {
        objectWillChange.send()
        resorts.remove(resort)
        try save()
    }

    private func save() throws {
        let encoded = try JSONEncoder().encode(resorts)
        UserDefaults.standard.setValue(encoded, forKey: saveKey)
    }
}
