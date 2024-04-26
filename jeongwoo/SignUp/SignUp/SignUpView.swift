import SwiftUI
struct Address {
    var street: String = ""
    var city: String = ""
    var postalCode: String = ""
    
}
struct SignUpView: View {
    @State private var firstName = ""
    @State private var lastName = ""
    @State private var address = Address()
    @State private var address2 = Address()
    @State private var lessThenTwo = false
    @State private var username = ""
    @State private var password = ""
    @State private var usernameErrorMessage = ""
    
    var body: some View {
        NavigationStack {
            Form {
                Section("Name") {
                    TextField("First Name", text: $firstName)
                        .border(.red)
                    if !usernameErrorMessage.isEmpty {
                        Text(usernameErrorMessage)
                            .font(.caption)
                            .foregroundStyle(.red)
                    }
                    TextField("Last Name", text: $lastName)
                }
                Section("Current Address") {
                    TextField("Street Address", text: $address.street)
                    TextField("City", text: $address.city)
                    TextField("Postal Address", text: $address.postalCode)
                    Toggle(isOn: $lessThenTwo) {
                        Text("Have you lived here for 2+ years")
                    }
                }
                if !lessThenTwo {
                    Section("Previous Address") {
                        TextField("Street Address", text: $address.street)
                        TextField("City", text: $address.city)
                        TextField("Postal Address", text: $address.postalCode)
                    }
                }
                Section {
                    TextField("Create Username", text: $username)
                    TextField("Create Password", text: $password)
                }
                Button("Submit") {
                    usernameErrorMessage = "Username을 입력하세요"
                    print("Form Submit action here")
                }
            }
            .navigationTitle("Sign Up")
        }
    }
}

#Preview {
    SignUpView()
}
