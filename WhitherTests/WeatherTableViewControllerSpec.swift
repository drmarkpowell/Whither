//
//  WeatherTableViewControllerSpec.swift
//  Whither
//
//  Created by Powell, Mark W (397F) on 6/5/17.
//  Copyright © 2017 Powellware. All rights reserved.
//

import Quick
import Nimble
import Swinject
@testable import Whither

class WeatherTableViewControllerSpec: QuickSpec {
    
    class MockNetwork: Networking {
        var requestCount = 0
        
        func request(respond: @escaping (NSData?) -> ()) {
            requestCount = requestCount + 1
        }
    }
    
    override func spec() {
        var container: Container!
        beforeEach {
            container = Container()
            container.register(Networking.self) { _ in MockNetwork() }
                .inObjectScope(.container) //this makes it a singleton
            container.register(WeatherFetcher.self) { r in
                WeatherFetcher(networking: r.resolve(Networking.self)!)
            }
            container.register(WeatherTableViewController.self) { r in
                let controller = WeatherTableViewController()
                controller.weatherFetcher = r.resolve(WeatherFetcher.self)
                return controller
            }
        }
        
        it("starts fetching weather information when the view is about appearing.") {
            let network = container.resolve(Networking.self) as! MockNetwork
            let controller = container.resolve(WeatherTableViewController.self)!
            
            expect(network.requestCount) == 0
            controller.viewWillAppear(true)
            expect(network.requestCount).toEventually(equal(1))
        }
    }
    
}
