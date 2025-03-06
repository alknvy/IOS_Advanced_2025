import SwiftUI

struct HeroRandomizerView: View {
    @State private var hero: Hero?

    var body: some View {
        VStack {
            if let hero = hero {
                VStack {
                    AsyncImage(url: URL(string: hero.images.lg)) { image in
                        image.resizable()
                    } placeholder: {
                        ProgressView()
                    }
                    .frame(width: 200, height: 200)
                    .clipShape(Circle())

                    Text(hero.name)
                        .font(.largeTitle)
                        .bold()

                    Text("Full Name: \(hero.biography.fullName ?? "Unknown")")
                    Text("Place of Birth: \(hero.biography.placeOfBirth ?? "Unknown")")
                    Text("Publisher: \(hero.biography.publisher ?? "Unknown")")

                    VStack(alignment: .leading) {
                        Text("Power Stats:")
                            .font(.headline)
                        Text("Intelligence: \(hero.powerstats.intelligence)")
                        Text("Strength: \(hero.powerstats.strength)")
                        Text("Speed: \(hero.powerstats.speed)")
                        Text("Durability: \(hero.powerstats.durability)")
                        Text("Power: \(hero.powerstats.power)")
                        Text("Combat: \(hero.powerstats.combat)")
                    }
                    .padding()
                }
                .padding()
            } else {
                Text("Tap the button to get a hero!")
            }

            Button(action: loadRandomHero) {
                Text("Get Random Hero")
                    .bold()
                    .frame(width: 200, height: 50)
                    .background(Color.blue)
                    .foregroundColor(.white)
                    .cornerRadius(10)
            }
            .padding()
        }
        .onAppear(perform: loadRandomHero)
    }

    private func loadRandomHero() {
        HeroService.shared.fetchRandomHero { hero in
            self.hero = hero
        }
    }
}
