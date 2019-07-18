//
//  ContactViewController.swift
//  AginicDS Agile Toolkit
//
//  Created by Paul Thornton on 06/06/2018.
//  Copyright © 2018 AginicDS. All rights reserved.
//

import UIKit
import WebKit

class ContactViewController: UIViewController, WKNavigationDelegate {
    
    //@IBOutlet weak var webview: UIWebView!
    var webView: WKWebView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
    
        let url = URL(string: "https://aginic.com/contact/")!
        
        webView.load(URLRequest(url: url))
        
        webView.addObserver(self, forKeyPath: #keyPath(WKWebView.estimatedProgress), options: .new, context: nil)
        
        webView.allowsBackForwardNavigationGestures = true
        
    }

    
    override func loadView() {
        webView = WKWebView()
        webView.navigationDelegate = self
        view = webView
    }
    
    
    override func observeValue(forKeyPath keyPath: String?, of object: Any?, change: [NSKeyValueChangeKey : Any]?, context: UnsafeMutableRawPointer?) {
        if keyPath == "estimatedProgress" {
            print(Float(webView.estimatedProgress))
        }
    }


    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

