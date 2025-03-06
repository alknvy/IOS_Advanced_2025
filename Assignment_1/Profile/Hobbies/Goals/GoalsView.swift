import SwiftUI

struct GoalsView: View {
    var body: some View {
        VStack {
            Text("My Goals 🎯")
                .font(.largeTitle)
                .bold()

            Text("🏆 Win a tournament")
                .padding()
            Text("📱 Build an iOS App")
                .padding()
            Text("📚 Learn Swift")
                .padding()

            Spacer()
        }
        .navigationTitle("Goals")
    }
}

#Preview {
    GoalsView()
}
