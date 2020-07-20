import SwiftUI

extension View {
    func phoneOnlyStackNavigationView() -> some View {
        if UIDevice.current.userInterfaceIdiom == .phone {
            return AnyView(self.navigationViewStyle(StackNavigationViewStyle()))
        } else {
            return AnyView(self)
        }
    }

    func badgeStyle(bgColor: Color) -> some View {
        modifier(BadgeViewModifier(bgColor: bgColor))
    }
}

struct BadgeViewModifier: ViewModifier {
    let bgColor: Color

    func body(content: Content) -> some View {
        content
            .font(.headline)
            .foregroundColor(.white)
            .padding(.horizontal, 10)
            .padding(.vertical, 5)
            .background(bgColor)
            .cornerRadius(5)
    }
}

struct AlertMessage: Identifiable {
    let id = UUID()
    let title: String
    var description: String? = nil

    var alert: Alert {
        Alert(
            title: Text(title),
            message: description != nil ? Text(description!) : nil
        )
    }
}
