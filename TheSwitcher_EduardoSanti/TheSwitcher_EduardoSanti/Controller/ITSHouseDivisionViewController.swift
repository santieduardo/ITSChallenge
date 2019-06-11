//
//  ITSHouseDivisionViewController.swift
//  TheSwitcher_EduardoSanti
//
//  Created by Eduardo Santi on 04/12/2018.
//  Copyright © 2018 Eduardo Santi. All rights reserved.
//

import UIKit

class ITSHouseDivisionViewController: UIViewController {

    // MARK: - IBOutlets
    @IBOutlet weak var tableView: UITableView!
    
    // MARK: - Variables
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }
    
    let generator = UIImpactFeedbackGenerator(style: .light)

    private let houseDivision = ITSHouseDivision()
    var dataSource = [ITSHouseDivision]()
    
    // MARK: - Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.setup()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        self.title = "Switcher App"
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        
        self.title = nil
    }
    
    // MARK: - Private Methods
    private func setup() {
        self.setNeedsStatusBarAppearanceUpdate()
        
        self.navigationController?.navigationBar.setColors(
            background: .customGreen,
            text: .white)
        
        self.loadHouseDivisions()
        
        self.tableView.tableFooterView = UIView()
    }
    
    private func loadHouseDivisions() {
        self.houseDivision.loadHouseDivisions { [weak self] (houseDivisions: [ITSHouseDivision]?) in
            guard let dataSource = houseDivisions else {
                return
            }
            
            self?.dataSource = dataSource
            self?.tableView.reloadData()
        }
    }
    
    // MARK: - Segue
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if  segue.identifier == "divisionDetailSegue",
            let destination = segue.destination as? ITSDivisionDetailViewController,
            let indexPath = self.tableView.indexPathForSelectedRow {
                destination.houseDivision = self.dataSource[indexPath.row]
        }
    }

}

// MARK: - ITSHouseDivisionViewController: UITableViewDataSource
extension ITSHouseDivisionViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(
            withIdentifier: ITSHomeDivisionTableViewCell.identifier,
            for: indexPath) as! ITSHomeDivisionTableViewCell
        
        cell.delegate = self
        cell.houseDivisionLabel.text = self.dataSource[indexPath.row].division
        cell.lightStateSwitch.isOn = self.dataSource[indexPath.row].isOn
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.dataSource.count
    }
}

// MARK: - ITSHouseDivisionViewController: UITableViewDelegate
extension ITSHouseDivisionViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
}

// MARK: - ITSHouseDivisionViewController: ITSHomeDivisionDelegate
extension ITSHouseDivisionViewController: ITSHomeDivisionDelegate {
    func homeDivision(didChange cell: ITSHomeDivisionTableViewCell) {
        guard let indexPath = self.tableView.indexPath(for: cell) else {
            return
        }
        
        self.generator.impactOccurred()
        
        self.dataSource[indexPath.row].changeLightState()
    }
}
