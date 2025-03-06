import Foundation

class HeroService {
    static let shared = HeroService()
    private let url = URL(string: "https://akabab.github.io/superhero-api/api/all.json")!
    
    func fetchRandomHero(completion: @escaping (Hero?) -> Void) {
        URLSession.shared.dataTask(with: url) { data, response, error in
            guard let data = data, error == nil else {
                print("Error fetching data:", error?.localizedDescription ?? "Unknown error")
                completion(nil)
                return
            }

            do {
                let heroes = try JSONDecoder().decode([Hero].self, from: data)
                let randomHero = heroes.randomElement()
                DispatchQueue.main.async {
                    completion(randomHero)
                }
            } catch {
                print("Decoding error:", error)
                completion(nil)
            }
        }.resume()
    }
}

