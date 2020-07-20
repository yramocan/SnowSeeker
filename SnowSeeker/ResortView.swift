import SwiftUI

struct ResortView: View {
    let resort: Resort

    @EnvironmentObject var favorites: Favorites
    @Environment(\.horizontalSizeClass) var sizeClass

    @State private var alertMessage: AlertMessage?

    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 0) {
                Image(decorative: resort.id)
                    .resizable()
                    .scaledToFit()

                Group {
                    HStack {
                        if sizeClass == .compact {
                            Spacer()
                            VStack { ResortDetailsView(resort: resort) }
                            VStack { SkiDetailsView(resort: resort) }
                            Spacer()
                        } else {
                            ResortDetailsView(resort: resort)
                            Spacer().frame(height: 0)
                            SkiDetailsView(resort: resort)
                        }
                    }
                    .font(.headline)
                    .foregroundColor(.secondary)
                    .padding(.top)

                    Text(resort.description)
                        .padding(.vertical)

                    Text("Facilities")
                        .font(.headline)

                    HStack {
                        ForEach(resort.facilities) { facility in
                            facility.icon
                                .font(.title)
                                .onTapGesture {
                                    alertMessage = facility.alertMessage
                                }
                        }
                    }
                    .padding(.vertical)
                }
                .padding(.horizontal)

                Button(favorites.contains(resort) ? "Remove from Favorites" : "Add to Favorites") {
                    if favorites.contains(resort) {
                        removeFromFavorites()
                    } else {
                        addToFavorites()
                    }
                }
                .padding()
            }
        }
        .alert(item: $alertMessage) { message in
            message.alert
        }
        .navigationBarTitle(Text("\(resort.name), \(resort.country)"), displayMode: .inline)
    }

    private func addToFavorites() {
        do {
            try favorites.add(resort)
        } catch {
            alertMessage = AlertMessage(
                title: "Save Error",
                description: "There was an error adding this resort to favorites."
            )
        }
    }

    private func removeFromFavorites() {
        do {
            try favorites.remove(resort)
        } catch {
            alertMessage = AlertMessage(
                title: "Removal Error",
                description: "There was an error removing this resort from favorites."
            )
        }
    }
}

struct ResortView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            ResortView(resort: .example)
                .previewDevice("iPhone 11 Pro")

            ResortView(resort: .example)
                .previewDevice("iPad Pro (11-inch) (2nd generation)")
        }
    }
}
