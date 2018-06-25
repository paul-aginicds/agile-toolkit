//
//  PeopleViewController.swift
//  AginicDS Toolkit
//
//  Created by Paul Thornton on 06/06/2018.
//  Copyright © 2018 AginicDS. All rights reserved.
//

import WebKit

class PeopleViewController: UIViewController {
    
    @IBOutlet weak var webview: UIWebView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        
        let url = URL(string: "http://www.aginicds.com/our-people/")
        
        let request = URLRequest(url: url!)
        
        webview.loadRequest(request)
        
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
}

