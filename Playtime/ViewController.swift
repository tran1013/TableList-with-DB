//
//  ViewController.swift
//  Playtime
//
//  Created by Anh Duc Tran on 29.03.17.
//  Copyright © 2017 Anh Duc Tran. All rights reserved.
//

import UIKit

class ViewController: UIViewController{
    
    @IBOutlet var txtInput: UITextField!
    @IBOutlet var txtLabel: UILabel!
    @IBOutlet var tableViewOutlet: UITableView!

    var db = database()
//    var zitat = ["blabla", "blueblue", "bliblibli"]
    var content = [String]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        content = db.getAll()
//        db.getAll()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    @IBAction func actButton(_ sender: UIButton) {
        
        let secView = storyboard?.instantiateViewController(withIdentifier: "SecondVC") as! SecondViewController
        //        secView.txtLabel_2.text = txtInput.text!
        //        navigationController?.pushViewController(secView, animated: true)
        
        if(txtInput.text?.isEmpty)!
        {
            print("Input is empty")
        } else {
            txtLabel.text = txtInput.text!
            secView.stringPass = txtInput.text!
            navigationController?.pushViewController(secView, animated: true)
            content.append(txtInput.text!)
            db.insert(content_: txtInput.text!)
            viewDidLoad()
            tableViewOutlet.reloadData()
            txtInput.text = ""
        }
        
    }
    
}

