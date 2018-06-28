//
//  RetroDetailViewContoller.swift
//  AginicDS Agile Toolkit
//
//  Created by Paul Thornton on 07/06/2018.
//  Copyright © 2018 AginicDS. All rights reserved.
//

import WebKit

class RetroDetailViewController: UIViewController {
    
   var technique:String = ""
    
    @IBOutlet weak var retroLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        retroLabel.text = technique
        
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
}

