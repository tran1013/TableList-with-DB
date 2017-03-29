//
//  SecondViewController.swift
//  Playtime
//
//  Created by Anh Duc Tran on 29.03.17.
//  Copyright © 2017 Anh Duc Tran. All rights reserved.
//

import UIKit

class SecondViewController : UIViewController {
   

    @IBOutlet var txtLabel_2: UILabel? = nil
    var stringPass = ""
    
    override func viewDidLoad() {
        txtLabel_2?.text = stringPass
        super.viewDidLoad()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    
}
