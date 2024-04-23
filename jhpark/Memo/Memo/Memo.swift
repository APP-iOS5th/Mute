//
//  Memo.swift
//  Memo
//
//  Created by 박지혜 on 4/23/24.
//

import SwiftUI
import SwiftData

// UIKit color
//extension UIColor {
//    func getRGBA() -> (red: CGFloat, green: CGFloat, blue: CGFloat, alpha: CGFloat) {
//        var red: CGFloat = 0
//        var green: CGFloat = 0
//        var blue: CGFloat = 0
//        var alpha: CGFloat = 0
//        
//        self.getRed(&red, green: &green, blue: &blue, alpha: &alpha)
//        
//        return (red, green, blue, alpha)
//    }
//}

//let (red, green, blue, alpha) = UIColor(memoColor).getRGBA()

// 16진수 형식의 hex 색상 코드(ex. #FF0000)를 SwiftUI의 Color 객체로 변환
extension Color {
    init(hex: String) {
            let hex = hex.trimmingCharacters(in: CharacterSet.alphanumerics.inverted)
            var int: UInt64 = 0
            Scanner(string: hex).scanHexInt64(&int)
            let a, r, g, b: UInt64
            
            // RGBA 값 추출
            switch hex.count {
            case 3: // RGB (12-bit)
                (a, r, g, b) = (255, (int >> 8) * 17, (int >> 4 & 0xF) * 17, (int & 0xF) * 17)
            case 6: // RGB (24-bit)
                (a, r, g, b) = (255, int >> 16, int >> 8 & 0xFF, int & 0xFF)
            case 8: // ARGB (32-bit)
                (a, r, g, b) = (int >> 24, int >> 16 & 0xFF, int >> 8 & 0xFF, int & 0xFF)
            default:
                (a, r, g, b) = (1, 1, 1, 0)
            }

            self.init(
                .sRGB,
                red: Double(r) / 255,
                green: Double(g) / 255,
                blue:  Double(b) / 255,
                opacity: Double(a) / 255
            )
    }
}

@Model
class Memo: Identifiable {
    var id = UUID()
    var text: String
    var colorHex: String
    var created: Date
    
    @Transient // 저장할 필요 없는 프로퍼티
    var createdString: String {
        get {
            let dateFormatter: DateFormatter = DateFormatter()
            dateFormatter.dateFormat = "yyyy-MM-dd"
            return dateFormatter.string(from: created)
        }
    }
    
    @Transient
    var color: Color {
        return Color(hex: colorHex)
    }
    
    init(text: String, color: Color, created: Date) {
        self.text = text
        self.colorHex = Memo.hexStringFromColor(color: color)
        self.created = created
    }
    
    // Color to Hex
    static func hexStringFromColor(color: Color) -> String {
        // RGB 컴포넌트로 분해
        let components = color.resolve(in: EnvironmentValues())
        
        let r: CGFloat = CGFloat(components.red)
        let g: CGFloat = CGFloat(components.green)
        let b: CGFloat = CGFloat(components.blue)
        
        // RGB 컴포넌트를 0~255 값, 16진수 형태로 변환
        let hexString = String.init(format: "#%02lX%02lX%02lX", lroundf(Float(r*255)), lroundf(Float(g*255)), lroundf(Float(b*255)))
        print(hexString)
        
        return hexString
    }
}
