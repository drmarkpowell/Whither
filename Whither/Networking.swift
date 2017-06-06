//
//  Networking.swift
//  Whither
//
//  Created by Powell, Mark W (397F) on 6/5/17.
//  Copyright © 2017 Powellware. All rights reserved.
//

import Foundation

protocol Networking {
    func request(respond: @escaping (NSData?) -> ())
}
