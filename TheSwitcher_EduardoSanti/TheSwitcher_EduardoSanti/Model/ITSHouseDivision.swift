//
//  ITSHouseDivision.swift
//  TheSwitcher_EduardoSanti
//
//  Created by Eduardo Santi on 04/12/2018.
//  Copyright © 2018 Eduardo Santi. All rights reserved.
//

import Foundation

class ITSHouseDivision: NSObject {
    
    /// Values to define a state
    enum ITSLightState {
        case off
        case on
    }
    
    /// The division name
    var division: String!
    
    /// The Light State
    var lightState: ITSLightState!
    
    /// A convenience variable to get a Boolean value
    var isOn: Bool {
        get {
            switch self.lightState! {
            case .on:
                return true
            case .off:
                return false
            }
        }
    }
    
    /**
     Default initializer
     */
    override init() {
        super.init()
    }
    
    /**
     Main initializer for ITSHouseDivision
     
     - Parameters:
        - division: The name for division
        - lightState: The light state
     */
    init(division: String, lightState: ITSLightState = ITSLightState.off) {
        super.init()
        
        self.division = division
        self.lightState = lightState
    }
    
    /**
     Changes the light state using the current state
     */
    func changeLightState() {
        switch self.lightState! {
        case .on:
            self.lightState = .off
        case .off:
            self.lightState = .on
        }
    }
    
    /**
     Simulates a simple HTTP Request
     
     - Parameters:
        - completion: A closure that contains an optional ITSHouseDivision array
     */
    func loadHouseDivisions(completion: ([ITSHouseDivision]?) -> ()){
        completion(
            [
                ITSHouseDivision(division: "Kitchen", lightState: .off),
                ITSHouseDivision(division: "Living room", lightState: .off),
                ITSHouseDivision(division: "Master bedroom", lightState: .off),
                ITSHouseDivision(division: "Guest's bedroom", lightState: .off)
            ]
        )
    }
}
