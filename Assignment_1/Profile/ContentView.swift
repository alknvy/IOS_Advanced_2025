import SwiftUI

struct MainProfileView: View {
    var body: some View {
        NavigationView {
            VStack {
                Image("profile_picture") 
                    .resizable()
                    .frame(width: 150, height: 150)
                    .clipShape(Circle())

                Text("Yersultan Alkenov")
                    .font(.title)
                    .bold()

                Text("19 years old | Almaty")
                    .font(.subheadline)
                    .foregroundColor(.gray)

                Text("iOS Developer learning SwiftUI")
                    .multilineTextAlignment(.center)
                    .padding()

                Spacer()

                NavigationLink("My Hobbies", destination: InterestsView())
                    .padding()
                    .background(Color.blue)
                    .foregroundColor(.white)
                    .cornerRadius(10)

                NavigationLink("My Goals", destination: GoalsView())
                    .padding()
                    .background(Color.green)
                    .foregroundColor(.white)
                    .cornerRadius(10)

                Spacer()
            }
            .navigationTitle("My Profile")
        }
    }
}

#Preview {
    MainProfileView()
}
