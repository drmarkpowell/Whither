//
//  Network.swift
//  Whither
//
//  Created by Powell, Mark W (397F) on 6/5/17.
//  Copyright © 2017 Powellware. All rights reserved.
//

import Foundation
import Alamofire

struct Network : Networking {
    func request(respond: @escaping (NSData?) -> ()) {
        Alamofire.request(OpenWeatherMap.url, parameters: OpenWeatherMap.parameters).responseData { response in
            respond(response.data as NSData?)
        }
    }
}
