import Foundation

extension Bundle {
    func decode<T: Decodable>(_ file: String) throws -> T {
        guard let url = self.url(forResource: file, withExtension: nil) else {
            throw BundleError.fileError(description: "Failed to locate \(file) in bundle")
        }

        let data = try Data(contentsOf: url)
        let loaded = try JSONDecoder().decode(T.self, from: data)

        return loaded
    }

    enum BundleError: Error {
        case fileError(description: String)

        var localDescription: String {
            switch self {
            case .fileError(let description):
                return description
            }
        }
    }
}
