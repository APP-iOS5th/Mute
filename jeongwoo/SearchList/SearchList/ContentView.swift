import SwiftUI

struct ContentView: View {
    @State var searchText = ""
    let food: [Food] = Food.sampleFood
    
    var searchResult: [Food] {
        if searchText.isEmpty {
            return food
        } else {
            return food.filter{ $0.name.lowercased().contains(searchText.lowercased())}
        }
    }
    
    var body: some View {
        NavigationStack {
            List {
                ForEach(searchResult, id: \.self) { food in
                    LabeledContent(food.name) {
                        Text("\(food.category.rawValue)")
                    }
                }
            }
            .searchable(text: $searchText, prompt: "Search for a food")
            .navigationTitle("Foods")
        }
    }
}

#Preview {
    ContentView()
}
