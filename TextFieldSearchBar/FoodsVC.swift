//
//  FoodsVC.swift
//  TextFieldSearchBar
//
//  Created by Apple on 05/07/18.
//  Copyright © 2018 Vignesh. All rights reserved.
//

import UIKit

class FoodsVC: UIViewController {

    @IBOutlet weak var searchTextField: UITextField!
    @IBOutlet weak var tableView: UITableView!
    
    var foods = ["sswq", "swrw", "kjjkj", "opojp", "qwwqe", "trewr", "yhtyh", "yeewr", "qcsdff", "terte", "pidssa", "bugr", "coke", "rrrw", "retr"]
    
    var searchArray = [String]()
    var searched = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = self
        tableView.delegate = self
        
        searchTextField.addTarget(self, action: #selector(textDidChange(_:)), for: .editingChanged)
    }
    
    @objc func textDidChange(_ textField: UITextField) {
        
        if let searchString = textField.text {
            searchArray = foods.filter({$0.prefix(searchString.lowercased().count) == searchString})
        }
        searched = true
        tableView.reloadData()
    }
}

extension FoodsVC: UITableViewDataSource, UITableViewDelegate {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if searched {
           return searchArray.count
        }else {
            return foods.count
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "FoodCell", for: indexPath) as? FoodCell else {return UITableViewCell()}
        if searched {
            cell.textLabel?.text = searchArray[indexPath.row]
        }else {
            cell.textLabel?.text = foods[indexPath.row]
        }
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let selectedRow = foods[indexPath.row]
        print(selectedRow)
    }
}




