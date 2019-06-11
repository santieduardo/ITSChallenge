//
//  ITSDivisionDetailViewController.swift
//  TheSwitcher_EduardoSanti
//
//  Created by Eduardo Santi on 05/12/2018.
//  Copyright © 2018 Eduardo Santi. All rights reserved.
//

import UIKit

class ITSDivisionDetailViewController: UIViewController {
    
    // MARK: - IBOutlets
    @IBOutlet weak var lightImageView: UIImageView!
    @IBOutlet weak var divisionInfoLabel: UILabel!
    @IBOutlet weak var lightStateLabel: UILabel!
    
    // MARK: - Variables
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }
    
    var houseDivision: ITSHouseDivision!

    // MARK: - Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.setup()
    }
    
    // MARK: - Private Methods
    private func setup() {
        self.setNeedsStatusBarAppearanceUpdate()
        
        self.title = self.houseDivision.division
        
        if self.houseDivision.isOn {
            self.lightImageView.image = UIImage(named: "light_image_ON")
            self.lightStateLabel.text = "ON"
        } else {
            self.lightImageView.image = UIImage(named: "light_image_OFF")
            self.lightStateLabel.text = "OFF"
        }
        
        self.divisionInfoLabel.text = "Your \(self.houseDivision.division!) light is"
    }
}
