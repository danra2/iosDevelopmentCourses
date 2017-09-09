//
//  WeatherVC.swift
//  rainyshinycloudy
//
//  Created by Daniel Ra on 8/14/17.
//  Copyright © 2017 Daniel Ra. All rights reserved.
//

import CoreLocation

class Location {
    static var sharedInstance = Location()
    private init() {}
    
    var latitude: Double!
    var longitude: Double!
}
