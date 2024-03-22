//
//  darkAndWhiteTheme.swift
//  firstProject
//
//  Created by Владислав Баранов on 21.03.2024.
//
import UIKit

class ThemeColors {
    static let shared = ThemeColors()
    
    private var lightModeColors: [String: UIColor] = [
        "background": UIColor.white,
        "text": UIColor.black,
        "previewText": UIColor.black
        // другие цвета для светлой темы
    ]
    private var darkModeColors: [String: UIColor] = [
        "background": UIColor.black,
        "text": UIColor.white,
        "previewText": UIColor.black
        // другие цвета для темной темы
    ]
    private init() {}
    func color(for key: String) -> UIColor? {
        if #available(iOS 13.0, *) {
            if UITraitCollection.current.userInterfaceStyle == .dark {
                return darkModeColors[key]
            }
        }
        
        
        return lightModeColors[key]
    }
}


extension UIApplication {
    var statusBarView: UIView? {
        if responds(to: Selector(("statusBar"))) {
            return value(forKey: "statusBar") as? UIView
        }
        return nil
    }
}
