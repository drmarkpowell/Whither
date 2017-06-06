//
//  SwinjectStoryboard+Setup.swift
//  Whither
//
//  Created by Powell, Mark W (397F) on 6/5/17.
//  Copyright © 2017 Powellware. All rights reserved.
//

import SwinjectStoryboard

extension SwinjectStoryboard {

    class func setup() {
        defaultContainer.storyboardInitCompleted(WeatherTableViewController.self) { r,c in
            c.weatherFetcher = r.resolve(WeatherFetcher.self)
        }
        defaultContainer.register(Networking.self) { _ in Network() }
        defaultContainer.register(WeatherFetcher.self) { r in
            WeatherFetcher(networking: r.resolve(Networking.self)!)
        }
    }
}
