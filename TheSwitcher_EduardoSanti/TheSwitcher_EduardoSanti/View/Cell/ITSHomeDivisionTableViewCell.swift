//
//  ITSHomeDivisionTableViewCell.swift
//  TheSwitcher_EduardoSanti
//
//  Created by Eduardo Santi on 05/12/2018.
//  Copyright © 2018 Eduardo Santi. All rights reserved.
//

import UIKit

protocol ITSHomeDivisionDelegate: class {
    func homeDivision(didChange cell: ITSHomeDivisionTableViewCell)
}

class ITSHomeDivisionTableViewCell: UITableViewCell {
    
    // MARK: - Identifier
    static let identifier = "homeDivisionCell"
    
    // MARK: - Delegate
    weak var delegate: ITSHomeDivisionDelegate?

    // MARK: - IBOutlets
    @IBOutlet weak var houseDivisionLabel: UILabel!
    @IBOutlet weak var lightStateSwitch: UISwitch!
    
    // MARK: - Life Cycle
    override func awakeFromNib() {
        super.awakeFromNib()
        
        self.lightStateSwitch.onTintColor = .customGreen
    }
    
    // MARK: - IBActions
    @IBAction func lightStateChanged(_ sender: UISwitch) {
        self.delegate?.homeDivision(didChange: self)
    }
    
}
