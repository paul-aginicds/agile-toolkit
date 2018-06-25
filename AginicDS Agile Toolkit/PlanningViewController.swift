//
//  PlanningViewController.swift
//  AginicDS Agile Toolkit
//
//  Created by Paul Thornton on 06/06/2018.
//  Copyright © 2018 AginicDS. All rights reserved.
//

import UIKit


class PlanningViewController: UIViewController {
    

    @IBOutlet weak var buttonOne: UIButton!
    
    @IBOutlet weak var buttonTwo: UIButton!

    var s:String = ""
    
    @IBAction func didHitButton(_ sender: UIButton) {
        
        s = (sender.titleLabel?.text)!

    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        

    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?)
    {
        if segue.destination is PlanningSizeViewController
        {
            let vc = segue.destination as? PlanningSizeViewController
            vc?.size = s
            

        }
    }
 
}

