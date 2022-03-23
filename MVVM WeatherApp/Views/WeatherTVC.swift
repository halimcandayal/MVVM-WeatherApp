//
//  WheatherTVC.swift
//  MVVM WeatherApp
//
//  Created by Halimcan Dayal on 23.03.2022.
//

import Foundation
import UIKit

class WeatherTVC: UITableViewController, AddWeatherDelegate {
    
    private var weatherListViewModel = WeatherListViewModel()
    private var lastUnitSelection: Unit!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.navigationController?.navigationBar.prefersLargeTitles = true
        
        let userDefaults = UserDefaults.standard
        if let value = userDefaults.value(forKey: "unit") as? String {
            self.lastUnitSelection = Unit(rawValue: value)
        }
        
    }
    
    func addWeatherDidSave(vm: WeatherViewModel) {
        weatherListViewModel.addWeatherViewModel(vm)
        self.tableView.reloadData()
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
            
        }
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return weatherListViewModel.numberOfRows(section)
    }
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "WeatherCell", for: indexPath) as! WeatherCell
        
        let weatherVM = weatherListViewModel.modelAt(indexPath.row)
        cell.configure(weatherVM)
        return cell
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if segue.identifier == "AddWeatherCityVC" {
            prepareSegueForAddWheatherCityVC(segue: segue)
        }else if segue.identifier == "SettingsTVC" {
            prepareSegueForSettingsTVC(segue: segue)
        }
    }
    private func prepareSegueForSettingsTVC(segue: UIStoryboardSegue) {
        
        guard let nav = segue.destination as? UINavigationController else {
            fatalError("Navigation not found")
        }
        guard let settingsTVC = nav.viewControllers.first as? SettingsTVC else {
            fatalError("SettingsTprepareSegueForSettingsTVCVC not found")
        }
        
        settingsTVC.delegate = self
    }
    
    
    func prepareSegueForAddWheatherCityVC(segue: UIStoryboardSegue) {
        
        guard let nav = segue.destination as? UINavigationController else {
            fatalError("Navigation not found")
        }
        guard let addWeatherCityVC = nav.viewControllers.first as? AddCityVC else {
            fatalError("AddCityVC not found")
        }
        
        addWeatherCityVC.delegate = self
    }
    
}

extension WeatherTVC: SettingsDelegate {
    
    func settingsDone(vm: SettingsViewModel) {
        if lastUnitSelection.rawValue != vm.selectedUnit.rawValue {
            weatherListViewModel.updateUnit(to: vm.selectedUnit)
            tableView.reloadData()
            lastUnitSelection = Unit(rawValue: vm.selectedUnit.rawValue)!
        }
    }
    
}
