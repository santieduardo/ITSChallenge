//
//  UINavigationBar+Extension.swift
//  TheSwitcher_EduardoSanti
//
//  Created by Eduardo Santi on 05/12/2018.
//  Copyright © 2018 Eduardo Santi. All rights reserved.
//

import UIKit

extension UINavigationBar {
    /// - Parameters:
    ///   - background: Background color
    ///   - text: Text color
    public func setColors(background: UIColor, text: UIColor) {
        self.isTranslucent = false
        self.backgroundColor = background
        self.barTintColor = background
        self.setBackgroundImage(UIImage(), for: .default)
        self.tintColor = text
        self.titleTextAttributes = [.foregroundColor: text]
    }
}
