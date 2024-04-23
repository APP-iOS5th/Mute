import SwiftUI

struct ContentView: View {
    @State private var password = "1"
    @State private var someText = "password"
    var body: some View {
        VStack {
            Text("enter your password!")
                .fontWeight(.medium)
            SecureField("Enter a password", text: $password)
            Text("password entered: \(password)")
                .italic()
            
            TextField("Enter some text", text: $someText)
                .padding()
            Text(someText)
                .font(.largeTitle)
                .underline()
            
            Text("changing text color and make it bold")
                .foregroundStyle(.red)
                .bold()
            Text("Use kerning to change space btween characters in the text")
                .kerning(4.0)
            Text("StrikeThrough")
                .strikethrough()
            Text("""
                    multilinemultilinemultilinemultilinemultilineultilinemultilinemultilinemultilinemultiline
                """)
            .background(.yellow)
            .multilineTextAlignment(.leading)
            .lineSpacing(10.0)
            
        }
        .padding()
    }
}

#Preview {
    ContentView()
}
