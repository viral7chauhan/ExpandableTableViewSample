//
//  ViewController.swift
//  ExpandableTableViewSample
//
//  Created by Falguni Viral Chauhan on 07/04/18.
//  Copyright © 2018 Falguni Viral Chauhan. All rights reserved.
//

import UIKit

struct CellDetails {
    var isOpened = false
    var sectionTitle: String
    var sectionData = [String]()
    
    static func getSampleTableDetails() -> [CellDetails] {
        return [CellDetails(isOpened: false, sectionTitle: "Title1", sectionData: ["Cell1", "Cell2", "Cell3"]),
                  CellDetails(isOpened: false, sectionTitle: "Title1", sectionData: ["Cell1", "Cell2", "Cell3"]),
                  CellDetails(isOpened: false, sectionTitle: "Title1", sectionData: ["Cell1", "Cell2", "Cell3"]),
                  CellDetails(isOpened: true, sectionTitle: "Title1", sectionData: ["Cell1", "Cell2", "Cell3"])]
        
    }
    
}

class TableViewController: UITableViewController {

    var tableViewData = CellDetails.getSampleTableDetails()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func numberOfSections(in tableView: UITableView) -> Int {
        return tableViewData.count
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if tableViewData[section].isOpened {
            return tableViewData[section].sectionData.count+1
        } else {
            return 1
        }
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let dataIndex = indexPath.row - 1
        if indexPath.row == 0 {
            let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
            cell.textLabel?.text = tableViewData[indexPath.section].sectionTitle
            cell.textLabel?.backgroundColor = .white
            return cell
        } else {
            let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
            cell.textLabel?.text = tableViewData[indexPath.section].sectionData[dataIndex]
            cell.textLabel?.backgroundColor = .gray
            return cell
        }
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if tableViewData[indexPath.section].isOpened {
            tableViewData[indexPath.section].isOpened = false
            let section = IndexSet.init(integer: indexPath.section)
            tableView.reloadSections(section, with: .automatic)
        } else {
            tableViewData[indexPath.section].isOpened = true
            let section = IndexSet.init(integer: indexPath.section)
            tableView.reloadSections(section, with: .automatic)
        }
    }
}

