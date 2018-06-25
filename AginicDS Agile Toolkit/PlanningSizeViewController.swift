//
//  PlanningSizeViewController.swift
//  AginicDS Agile Toolkit
//
//  Created by Paul Thornton on 06/06/2018.
//  Copyright © 2018 AginicDS. All rights reserved.
//

import UIKit


class PlanningSizeViewController: UIViewController {
    
    var size:String = ""
    @IBOutlet weak var sizeButton: UIButton!
    
    @IBAction func onCloseButton(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        sizeButton.setTitle(size, for: .normal)
        
    }
    
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    


}

