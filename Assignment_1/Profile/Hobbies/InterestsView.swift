import SwiftUI

struct InterestsView: View {
    var body: some View {
        VStack {
            Text("My Hobbies 🏀🥊")
                .font(.largeTitle)
                .bold()

            VStack {
                Text("🏀 Basketball")
                    .font(.headline)
                Image("Basketball")
                    .resizable()
                    .frame(width: 200, height: 200)
                Text("I have been playing basketball since 2018")
            }
            .padding()

            VStack {
                Text("🥊 Boxing")
                    .font(.headline)
                Image("Boxing")
                    .resizable()
                    .frame(width: 200, height: 200)
                Text("Boxing is my second passion.")
            }
            .padding()

            Spacer()
        }
        .navigationTitle("Hobbies")
    }
}

#Preview {
    InterestsView()
}
