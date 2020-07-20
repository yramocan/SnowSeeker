import SwiftUI

struct ResortDetailsView: View {
    let resort: Resort
    
    var body: some View {
        Group {
            HStack {
                Image(systemName: "ruler.fill")
                Text("Size: \(size)")
            }
            .badgeStyle(bgColor: .blue)
            .layoutPriority(1)

            Spacer().frame(height: 0)

            HStack {
                Image(systemName: "dollarsign.circle.fill")
                Text("Price: \(price)")
            }
            .badgeStyle(bgColor: .blue)
            .layoutPriority(1)
        }
    }
}

extension ResortDetailsView {
    var price: String {
        String(repeating: "$", count: resort.price)
    }
    
    var size: String {
        switch resort.size {
        case 1:
            return "Small"
        case 2:
            return "Average"
        default:
            return "Large"
        }
    }
}

struct ResortDetailsView_Previews: PreviewProvider {
    static var previews: some View {
        VStack(spacing: 8) {
            ResortDetailsView(resort: .example)
        }
        .padding(20)
        .previewLayout(.sizeThatFits)
    }
}
