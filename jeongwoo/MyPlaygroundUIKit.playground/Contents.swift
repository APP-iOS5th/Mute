import UIKit

let theAnswerToTheUltimateQuestion = 42
//var greeting = "Hello, playground"
var restaurantRating: Double = 3
//restaurantRating = "Good"

let a = 12
let b = 12.0
let c = Double(a) + b

var d = 1
d += 2
d -= 1

let greeting = "Good" + "Morning"

let rating = 3.5
var ratingResult = "The restaurant rating is" + String(rating)
ratingResult = "The restaurant rating is \(rating)"

print(ratingResult)

let isRestaurantOpen = true
if isRestaurantOpen {
   print("Restaurant is poen")
}

let isRestaurantFound = false
if !isRestaurantFound {
    print("Restaurent was not found")
}

let drinkingAgeLimit = 21
let customerAge = 23
if customerAge < drinkingAgeLimit {
    print("Under age limit")
} else {
    print("Over age limit")
}

let trafficLightColor = "Yellow"
switch trafficLightColor {
case "Red":
    print("Stop")
case "Yellow":
    print("Caution")
case "Green":
    print("Go")
default:
    print("Invalid color")
}

var spouseName: String?
print(spouseName ?? "No Value in spouseName")
spouseName = "Nia"
print(spouseName ?? "No Value in spouseName")

if let spouseTempVar = spouseName {
    let greeting = "Hello, " + spouseTempVar
    print(greeting)
} else {
    print("No one")
}

let myRange = 10...20
let myRange2 = 10..<20

for number in myRange {
    print(number)
}

for number in myRange2 {
    print(number)
}

for number in (0...5).reversed() {
    print(number)
}
var y = 50
while y < 50 {
    y += 5
    print("y is \(y)")
}


//var x = 50
//repeat {
//    x += 5
//    print("x is \(x)")
//} while x < 50

var shoppingList = ["Egg", "Milk"]
print(shoppingList.count)
shoppingList.append("Cooking Oil")
shoppingList = shoppingList + ["Chicken"]
shoppingList.insert("Wather", at: 1)

shoppingList.remove(at: 1)
let removeElement = shoppingList.removeLast()

print("remove: \(removeElement)")
