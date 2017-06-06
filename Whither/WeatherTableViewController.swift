//
//  WeatherTableViewController.swift
//  Whither
//
//  Created by Powell, Mark W (397F) on 6/5/17.
//  Copyright © 2017 Powellware. All rights reserved.
//

import UIKit

class WeatherTableViewController: UITableViewController {
    var weatherFetcher: WeatherFetcher?
    
    private var cities = [City]() {
        didSet {
            tableView.reloadData()
        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        weatherFetcher?.fetch {
            if let cities = $0 {
                self.cities = cities
            }
            else {
                // Show an error message.
            }
        }
    }
    
    // MARK: UITableViewDataSource
    override func tableView(
        _ tableView: UITableView,
        numberOfRowsInSection section: Int) -> Int {
        return cities.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(
            withIdentifier: "cell", for: indexPath as IndexPath)
        let city = cities[indexPath.row]
        cell.textLabel?.text = city.name
        cell.detailTextLabel?.text = city.weather
        return cell
    }

}
