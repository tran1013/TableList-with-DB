//
//  TableView.swift
//  Playtime
//
//  Created by Anh Duc Tran on 29.03.17.
//  Copyright © 2017 Anh Duc Tran. All rights reserved.
//

import Foundation
import UIKit

extension ViewController : UITableViewDelegate, UITableViewDataSource
{
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return content.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableViewOutlet.dequeueReusableCell(withIdentifier: "CellIdentifier", for: indexPath) as UITableViewCell
        
//        let zitate = zitat[indexPath.row] as String
//        var content = db.getAll()
        let contentTable = content[indexPath.row] as String
        cell.textLabel!.text = contentTable
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("Tap on item at index \(indexPath)")
    }
    
    func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        return true
    }
    
//    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
//        if editingStyle == .delete
//        {
//            zitat.remove(at: indexPath.row)
//            tableViewOutlet.deleteRows(at: [indexPath], with: UITableViewRowAnimation.fade)
//        } else if editingStyle == .insert
//        {
//        
//        }
//    }
    
    func tableView(_ tableView: UITableView, editActionsForRowAt indexPath: IndexPath) -> [UITableViewRowAction]? {
        let update = UITableViewRowAction(style: .normal, title: "Update") { action, index in
            print("update")
        }
        let delete = UITableViewRowAction(style: .normal, title: "Delete") { action, index in
            print("delete")
            self.db.delete(content_: indexPath.row.description)
            self.content.remove(at: indexPath.row)
            self.tableViewOutlet.deleteRows(at: [indexPath], with: UITableViewRowAnimation.fade)
        }
    
        update.backgroundColor = UIColor.orange
        delete.backgroundColor = UIColor.red
        return [delete, update]
    }
}
