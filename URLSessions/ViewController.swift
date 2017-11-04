//
//  ViewController.swift
//  URLSessions
//
//  Created by Kumar, Sravan on 31/10/17.
//  Copyright © 2017 Kumar, Sravan. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    
    var modelObjects =   URLManager.shared.fetchDataModel

    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    
        tableView.estimatedRowHeight = 65
        tableView.rowHeight = UITableViewAutomaticDimension
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
       
    }

    fileprivate func downloadFiles() {

    }
}

//MARK: TableView Methods
extension ViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return modelObjects.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if let cell = tableView.dequeueReusableCell(withIdentifier: "Cell") as? CustomTableViewCell {
            cell.configureCell(model: modelObjects[indexPath.row])
            cell.delegate = self
            return cell
        }
        return UITableViewCell()
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableViewAutomaticDimension
    }
}

extension ViewController: CustomTableViewCellProtocol {
    func tableViewCell(_ customCell: CustomTableViewCell, _ didTapDownloadButton: UIButton) {
        print("didTapDownloadButton")
    }
}
