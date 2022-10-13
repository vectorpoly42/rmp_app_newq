//
//  Colors.swift
//  TableViewExample
//
//  Created by Andrey Korotkov on 12.10.2021.
//

import UIKit.UIColor

enum Color {
    static var middleBlue: UIColor { return color(hex: "7ed6df")}
    static var greenlandGreen: UIColor { return color(hex: "22a6b3")}
    static var exodusFruit: UIColor { return color(hex: "686de0")}
    static var blurple: UIColor { return color(hex: "4834d4")}
    static var carminePink: UIColor { return color(hex: "eb4d4b")}
    static var pinkGlamour: UIColor { return color(hex: "ff7979")}
}

private extension Color {
    private static func color(hex: String, alpha: CGFloat = 1.0) -> UIColor {
        return UIColor(hexString: hex, alpha: alpha)
    }
}

extension Color {
    static var random: UIColor {
        let colorsArray: [UIColor] = [Color.middleBlue, Color.greenlandGreen, Color.exodusFruit, Color.blurple, Color.carminePink, Color.pinkGlamour]
        return colorsArray.randomElement() ?? .white
    }
}
