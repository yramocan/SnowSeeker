import SwiftUI

struct PrimaryView: View {
    var body: some View {
        VStack(alignment: .leading) {
            Text("Header")
                .font(.title)
                .bold()

            Spacer()

            VStack(alignment: .leading) {
                HStack {
                    Image(systemName: "checkmark.circle.fill")
                        .foregroundColor(.green)
                    Text("Step 1")
                }

                HStack {
                    Image(systemName: "checkmark.circle")
                        .foregroundColor(.gray)
                    Text("Step 2")
                }

                HStack {
                    Image(systemName: "checkmark.circle")
                        .foregroundColor(.gray)
                    Text("Step 3")
                }

                HStack {
                    Image(systemName: "checkmark.circle")
                        .foregroundColor(.gray)
                    Text("Step 4")
                }
            }

            Spacer()

            Button(action: {}) {
                HStack {
                    Image(systemName: "plus.circle")
                    Text("Add Adjustment")
                }
            }
        }
    }
}

struct DetailView: View {
    var body: some View {
        Text("Detail View")
    }
}

struct ContentView: View {
    let resorts: [Resort] = try! Bundle.main.decode("resorts.json")

    var body: some View {
        NavigationView {
            List(resorts) { resort in
                NavigationLink(destination: ResortView(resort: resort)) {
                    Image(resort.country)
                        .resizable()
                        .scaledToFill()
                        .frame(width: 40, height: 25)
                        .clipShape(
                            RoundedRectangle(cornerRadius: 5)
                        )
                        .overlay(
                            RoundedRectangle(cornerRadius: 5)
                                .stroke(Color.black, lineWidth: 1)
                        )

                    VStack(alignment: .leading) {
                        Text(resort.name)
                            .font(.headline)
                        Text("\(resort.runs) runs")
                            .foregroundColor(.secondary)
                    }
                }
            }
            .navigationBarTitle("Resorts")

            WelcomeView()
        }
        .phoneOnlyStackNavigationView()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
