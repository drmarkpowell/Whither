//
//  OpenWeatherMap.swift
//  Whither
//
//  Created by Powell, Mark W (397F) on 6/5/17.
//  Copyright © 2017 Powellware. All rights reserved.
//

import Foundation

struct OpenWeatherMap {
    private static let apiKey = "85deaa353de663c4fda76251554619b3"
    
    private static let cityIds = [
        6077243, 524901, 5368361, 1835848, 3128760, 4180439,
        2147714, 264371, 1816670, 2643743, 3451190, 1850147
    ]
    
    static let url = "http://api.openweathermap.org/data/2.5/group"
    
    static var parameters: [String: String] {
        return [
            "APPID": apiKey,
            "id": cityIds.map { String($0) }.joined(separator: ",")
        ]
    }
}
