//
//  TableViewController.swift
//  JimSoftHMAC
//
//  Created by mdy on 08.08.2021.
//

import UIKit

class TableViewController: UITableViewController {

  var model = EndPointsModel()
  
  override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return model.endPoints.count
  }
 
  override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let cell = tableView.dequeueReusableCell(withIdentifier: "EndPoints", for: indexPath)

    cell.textLabel?.text = model.endPoints[indexPath.row].name
       
    return cell
  }
    
}
