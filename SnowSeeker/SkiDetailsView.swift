import SwiftUI

struct SkiDetailsView: View {
    let resort: Resort

    var body: some View {
        Group {
            HStack {
                Image(systemName: "arrow.up.circle.fill")
                Text("Elevation: \(resort.elevation)m")
            }
            .badgeStyle(bgColor: .blue)
            .layoutPriority(1)

            Spacer().frame(height: 0)

            HStack {
                Image(systemName: "snow")
                Text("Snow: \(resort.snowDepth)cm")
            }
            .badgeStyle(bgColor: Color.blue.opacity(0.75))
            .layoutPriority(1)
        }
    }
}

struct SkiDetailsView_Previews: PreviewProvider {
    static var previews: some View {
        VStack {
            SkiDetailsView(resort: Resort.example)
        }
        .padding(20)
        .previewLayout(.sizeThatFits)
    }
}
