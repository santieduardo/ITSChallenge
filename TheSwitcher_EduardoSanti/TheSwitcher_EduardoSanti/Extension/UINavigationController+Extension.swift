//
//  UINavigationController+Extension.swift
//  TheSwitcher_EduardoSanti
//
//  Created by Eduardo Santi on 05/12/2018.
//  Copyright © 2018 Eduardo Santi. All rights reserved.
//

import UIKit

extension UINavigationController {
    override open var preferredStatusBarStyle: UIStatusBarStyle {
        return topViewController?.preferredStatusBarStyle ?? .default
    }
}
