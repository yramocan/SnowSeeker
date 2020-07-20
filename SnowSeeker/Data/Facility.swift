import SwiftUI

struct Facility: Codable, Hashable, Identifiable {
    let id: UUID
    let name: String

    var alertMessage: AlertMessage {
        let messages = [
            "Accommodation": "This resort has popular on-site accommodation.",
            "Beginners": "This resort has lots of ski schools.",
            "Cross-country": "This resort has many cross-country ski routes.",
            "Eco-friendly": "This resort has won an award for environmental friendliness.",
            "Family": "This resort is popular with families."
        ]

        if let message = messages[name] {
            return AlertMessage(title: name, description: message)
        } else {
            fatalError("Unknown facility type: \(name)")
        }
    }

    var icon: some View {
        let icons = [
            "Accommodation": "house",
            "Beginners": "1.circle",
            "Cross-country": "map",
            "Eco-friendly": "leaf.arrow.circlepath",
            "Family": "person.3"
        ]

        if let iconName = icons[name] {
            let image = Image(systemName: iconName)
                .accessibility(label: Text(name))
                .foregroundColor(.secondary)
            return image
        } else {
            fatalError("Unknown facility type: \(name)")
        }
    }

    init(from decoder: Decoder) throws {
        let container = try decoder.singleValueContainer()

        id = UUID()
        name = try container.decode(String.self)
    }

    func encode(to encoder: Encoder) throws {
        var container = encoder.singleValueContainer()
        try container.encode(name)
    }

    func hash(into hasher: inout Hasher) {
        hasher.combine(name)
    }

    static func == (lhs: Facility, rhs: Facility) -> Bool {
        return lhs.name == rhs.name
    }
}
